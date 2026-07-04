class CookedMeal {
  final String id;
  final String recipeId;
  final String recipeTitle;
  final String? plannedMealId;
  final DateTime cookedAt;
  final double servingsCooked;
  final double servingsRemaining;
  final DateTime? estimatedGoodUntil;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CookedMeal({
    required this.id,
    required this.recipeId,
    required this.recipeTitle,
    this.plannedMealId,
    required this.cookedAt,
    required this.servingsCooked,
    required this.servingsRemaining,
    this.estimatedGoodUntil,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get hasLeftovers => servingsRemaining > 0;
  bool get isStillGood =>
      estimatedGoodUntil == null || estimatedGoodUntil!.isAfter(DateTime.now());
}
