class PlannedMeal {
  final String id;
  final String mealPlanId;
  final String recipeId;
  final String recipeTitle;
  final double? recipeServings;
  final DateTime? plannedDate;
  final String status; // planned | cooked | skipped
  final DateTime? cookedAt;
  final double? servingsPlanned;
  final double? servingsRemaining;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PlannedMeal({
    required this.id,
    required this.mealPlanId,
    required this.recipeId,
    required this.recipeTitle,
    this.recipeServings,
    this.plannedDate,
    required this.status,
    this.cookedAt,
    this.servingsPlanned,
    this.servingsRemaining,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isCooked => status == 'cooked';
  bool get isPlanned => status == 'planned';
}
