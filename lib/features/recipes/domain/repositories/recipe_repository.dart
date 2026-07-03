import '../models/recipe.dart';

abstract class RecipeRepository {
  Stream<List<Recipe>> watchRecipes();
  Future<void> addRecipe(Recipe recipe);
  Future<void> deleteRecipe(String id);
}