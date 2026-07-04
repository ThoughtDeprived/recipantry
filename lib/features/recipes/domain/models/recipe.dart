import 'recipe_ingredient.dart';
import 'recipe_step.dart';

class Recipe {
  final String id;
  final String title;
  final double? servings;
  final String instructions;
  final List<RecipeIngredient> ingredients;
  final List<RecipeStep> steps;

  Recipe({
    required this.id,
    required this.title,
    this.servings,
    required this.instructions,
    this.ingredients = const [],
    this.steps = const [],
  });
}