class RecipeStep {
  final String id;
  final String recipeId;
  final String? sectionName;
  final int stepNumber;
  final String instruction;
  final int? timerMinutes;
  final int sortOrder;

  const RecipeStep({
    required this.id,
    required this.recipeId,
    this.sectionName,
    required this.stepNumber,
    required this.instruction,
    this.timerMinutes,
    required this.sortOrder,
  });
}
