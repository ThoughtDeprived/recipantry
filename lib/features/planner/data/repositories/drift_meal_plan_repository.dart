import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/db/app_database.dart';
import '../../domain/models/cooked_meal.dart' as dc;
import '../../domain/models/planned_meal.dart' as dm;
import '../../domain/models/weekly_plan.dart';
import '../../domain/repositories/meal_plan_repository.dart';

class DriftMealPlanRepository implements MealPlanRepository {
  final AppDatabase db;

  DriftMealPlanRepository(this.db);

  static DateTime _weekStart(DateTime date) =>
      DateTime(date.year, date.month, date.day - (date.weekday - 1));

  @override
  Stream<WeeklyPlan?> watchWeekPlan(DateTime weekStart) {
    final weekStartMs = _weekStart(weekStart).millisecondsSinceEpoch;

    final query = db.select(db.mealPlans).join([
      leftOuterJoin(
        db.plannedMeals,
        db.plannedMeals.mealPlanId.equalsExp(db.mealPlans.id),
      ),
      leftOuterJoin(
        db.recipes,
        db.recipes.id.equalsExp(db.plannedMeals.recipeId),
      ),
    ])
      ..where(db.mealPlans.weekStartDate.equals(weekStartMs))
      ..orderBy([
        OrderingTerm(expression: db.plannedMeals.plannedDate, nulls: NullsOrder.first),
        OrderingTerm.asc(db.plannedMeals.createdAt),
      ]);

    return query.watch().map((rows) {
      if (rows.isEmpty) return null;

      final planRow = rows.first.readTableOrNull(db.mealPlans);
      if (planRow == null) return null;

      final meals = rows
          .where((row) => row.readTableOrNull(db.plannedMeals) != null)
          .map((row) {
            final mealRow = row.readTable(db.plannedMeals);
            final recipeRow = row.readTableOrNull(db.recipes);
            return dm.PlannedMeal(
              id: mealRow.id,
              mealPlanId: mealRow.mealPlanId,
              recipeId: mealRow.recipeId,
              recipeTitle: recipeRow?.title ?? 'Unknown Recipe',
              recipeServings: recipeRow?.servings,
              plannedDate: mealRow.plannedDate != null
                  ? DateTime.fromMillisecondsSinceEpoch(mealRow.plannedDate!)
                  : null,
              status: mealRow.status,
              cookedAt: mealRow.cookedAt != null
                  ? DateTime.fromMillisecondsSinceEpoch(mealRow.cookedAt!)
                  : null,
              servingsPlanned: mealRow.servingsPlanned,
              servingsRemaining: mealRow.servingsRemaining,
              notes: mealRow.notes,
              createdAt: DateTime.fromMillisecondsSinceEpoch(mealRow.createdAt),
              updatedAt: DateTime.fromMillisecondsSinceEpoch(mealRow.updatedAt),
            );
          })
          .toList();

      return WeeklyPlan(
        id: planRow.id,
        weekStartDate: DateTime.fromMillisecondsSinceEpoch(planRow.weekStartDate),
        meals: meals,
        createdAt: DateTime.fromMillisecondsSinceEpoch(planRow.createdAt),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(planRow.updatedAt),
      );
    });
  }

  @override
  Stream<List<dc.CookedMeal>> watchRecentCookedMeals() {
    final cutoff = DateTime.now()
        .subtract(const Duration(days: 7))
        .millisecondsSinceEpoch;

    final query = db.select(db.cookedMeals).join([
      leftOuterJoin(db.recipes, db.recipes.id.equalsExp(db.cookedMeals.recipeId)),
    ])
      ..where(db.cookedMeals.cookedAt.isBiggerOrEqualValue(cutoff))
      ..orderBy([OrderingTerm.desc(db.cookedMeals.cookedAt)]);

    return query.watch().map((rows) => rows.map((row) {
          final meal = row.readTable(db.cookedMeals);
          final recipe = row.readTableOrNull(db.recipes);
          return dc.CookedMeal(
            id: meal.id,
            recipeId: meal.recipeId,
            recipeTitle: recipe?.title ?? 'Unknown',
            plannedMealId: meal.plannedMealId,
            cookedAt: DateTime.fromMillisecondsSinceEpoch(meal.cookedAt),
            servingsCooked: meal.servingsCooked,
            servingsRemaining: meal.servingsRemaining,
            estimatedGoodUntil: meal.estimatedGoodUntil != null
                ? DateTime.fromMillisecondsSinceEpoch(meal.estimatedGoodUntil!)
                : null,
            notes: meal.notes,
            createdAt: DateTime.fromMillisecondsSinceEpoch(meal.createdAt),
            updatedAt: DateTime.fromMillisecondsSinceEpoch(meal.updatedAt),
          );
        }).toList());
  }

  @override
  Future<String> ensureWeekPlan(DateTime weekStart) async {
    final weekStartMs = _weekStart(weekStart).millisecondsSinceEpoch;
    final existing = await (db.select(db.mealPlans)
          ..where((t) => t.weekStartDate.equals(weekStartMs)))
        .getSingleOrNull();
    if (existing != null) return existing.id;

    final id = const Uuid().v4();
    final now = DateTime.now().millisecondsSinceEpoch;
    await db.into(db.mealPlans).insert(MealPlansCompanion.insert(
      id: id,
      weekStartDate: weekStartMs,
      createdAt: now,
      updatedAt: now,
    ));
    return id;
  }

  @override
  Future<void> addMealToPlan(
    String mealPlanId,
    String recipeId,
    String recipeTitle, {
    double? servings,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await db.into(db.plannedMeals).insert(PlannedMealsCompanion.insert(
      id: const Uuid().v4(),
      mealPlanId: mealPlanId,
      recipeId: recipeId,
      servingsPlanned: Value(servings),
      createdAt: now,
      updatedAt: now,
    ));
  }

  @override
  Future<void> assignMealToDay(String plannedMealId, DateTime? date) async {
    await (db.update(db.plannedMeals)
          ..where((t) => t.id.equals(plannedMealId)))
        .write(PlannedMealsCompanion(
          plannedDate: Value(date?.millisecondsSinceEpoch),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ));
  }

  @override
  Future<void> removeMealFromPlan(String plannedMealId) async {
    await (db.delete(db.plannedMeals)
          ..where((t) => t.id.equals(plannedMealId)))
        .go();
  }

  @override
  Future<void> markMealCooked(
    String plannedMealId, {
    double? servingsCooked,
    String? notes,
  }) async {
    final planned = await (db.select(db.plannedMeals)
          ..where((t) => t.id.equals(plannedMealId)))
        .getSingleOrNull();
    if (planned == null) return;

    final recipe = await (db.select(db.recipes)
          ..where((t) => t.id.equals(planned.recipeId)))
        .getSingleOrNull();

    final now = DateTime.now();
    final cookedServings =
        servingsCooked ?? planned.servingsPlanned ?? recipe?.servings ?? 4;
    final goodUntil = now.add(const Duration(days: 4));

    await db.into(db.cookedMeals).insert(CookedMealsCompanion.insert(
      id: const Uuid().v4(),
      recipeId: planned.recipeId,
      plannedMealId: Value(plannedMealId),
      cookedAt: now.millisecondsSinceEpoch,
      servingsCooked: cookedServings,
      servingsRemaining: cookedServings,
      estimatedGoodUntil: Value(goodUntil.millisecondsSinceEpoch),
      notes: Value(notes),
      createdAt: now.millisecondsSinceEpoch,
      updatedAt: now.millisecondsSinceEpoch,
    ));

    await (db.update(db.plannedMeals)
          ..where((t) => t.id.equals(plannedMealId)))
        .write(PlannedMealsCompanion(
          status: const Value('cooked'),
          cookedAt: Value(now.millisecondsSinceEpoch),
          servingsRemaining: Value(cookedServings),
          updatedAt: Value(now.millisecondsSinceEpoch),
        ));
  }

  @override
  Future<void> updateServingsRemaining(
      String cookedMealId, double servingsRemaining) async {
    await (db.update(db.cookedMeals)
          ..where((t) => t.id.equals(cookedMealId)))
        .write(CookedMealsCompanion(
          servingsRemaining: Value(servingsRemaining),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ));
  }
}
