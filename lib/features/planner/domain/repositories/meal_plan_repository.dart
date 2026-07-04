import '../models/cooked_meal.dart';
import '../models/weekly_plan.dart';

abstract class MealPlanRepository {
  Stream<WeeklyPlan?> watchWeekPlan(DateTime weekStart);
  Stream<List<CookedMeal>> watchRecentCookedMeals();
  Future<String> ensureWeekPlan(DateTime weekStart);
  Future<void> addMealToPlan(
    String mealPlanId,
    String recipeId,
    String recipeTitle, {
    double? servings,
  });
  Future<void> assignMealToDay(String plannedMealId, DateTime? date);
  Future<void> removeMealFromPlan(String plannedMealId);
  Future<void> markMealCooked(
    String plannedMealId, {
    double? servingsCooked,
    String? notes,
  });
  Future<void> updateServingsRemaining(String cookedMealId, double servingsRemaining);
}
