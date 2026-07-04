import 'planned_meal.dart';

class WeeklyPlan {
  final String id;
  final DateTime weekStartDate;
  final List<PlannedMeal> meals;
  final DateTime createdAt;
  final DateTime updatedAt;

  const WeeklyPlan({
    required this.id,
    required this.weekStartDate,
    required this.meals,
    required this.createdAt,
    required this.updatedAt,
  });

  List<PlannedMeal> get unscheduled =>
      meals.where((m) => m.plannedDate == null && !m.isCooked).toList();

  List<PlannedMeal> mealsForDay(DateTime date) => meals
      .where((m) =>
          m.plannedDate != null && _sameDay(m.plannedDate!, date))
      .toList();

  List<PlannedMeal> get cookedMeals =>
      meals.where((m) => m.isCooked).toList();

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
