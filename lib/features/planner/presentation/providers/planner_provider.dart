import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/recipes/presentation/providers/recipes_provider.dart';
import '../../data/repositories/drift_meal_plan_repository.dart';
import '../../domain/models/cooked_meal.dart';
import '../../domain/models/weekly_plan.dart';
import '../../domain/repositories/meal_plan_repository.dart';

final mealPlanRepositoryProvider = Provider<MealPlanRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DriftMealPlanRepository(db);
});

final selectedWeekProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day)
      .subtract(Duration(days: now.weekday - 1));
});

final currentWeekPlanProvider = StreamProvider<WeeklyPlan?>((ref) {
  final repo = ref.watch(mealPlanRepositoryProvider);
  final weekStart = ref.watch(selectedWeekProvider);
  return repo.watchWeekPlan(weekStart);
});

final recentCookedMealsProvider = StreamProvider<List<CookedMeal>>((ref) {
  final repo = ref.watch(mealPlanRepositoryProvider);
  return repo.watchRecentCookedMeals();
});
