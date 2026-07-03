class Recipe {
  final String id;
  final String title;
  final double? servings;
  final String instructions;

  Recipe({
    required this.id,
    required this.title,
    this.servings,
    required this.instructions,
  });
}