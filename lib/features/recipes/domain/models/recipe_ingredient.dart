class RecipeIngredient {
  final String id;
  final String recipeId;
  final String? ingredientId;
  final String ingredientKey;
  final String displayName;
  final double? quantity;
  final String? unit;
  final String? note;
  final int sortOrder;
  final List<RecipeIngredientSubstitute> substitutes;

  const RecipeIngredient({
    required this.id,
    required this.recipeId,
    this.ingredientId,
    required this.ingredientKey,
    required this.displayName,
    this.quantity,
    this.unit,
    this.note,
    required this.sortOrder,
    this.substitutes = const [],
  });
}

class RecipeIngredientSubstitute {
  final String id;
  final String recipeIngredientId;
  final String substituteIngredientKey;
  final String substituteDisplayName;
  final double? quantity;
  final String? unit;
  final String? note;
  final int sortOrder;

  const RecipeIngredientSubstitute({
    required this.id,
    required this.recipeIngredientId,
    required this.substituteIngredientKey,
    required this.substituteDisplayName,
    this.quantity,
    this.unit,
    this.note,
    required this.sortOrder,
  });
}
