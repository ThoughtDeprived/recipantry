import '../models/recipe.dart';

abstract class RecipeRepository {
  Stream<List<Recipe>> watchRecipes();
  Stream<Recipe?> watchRecipe(String id);
  Future<void> addRecipe(Recipe recipe);
  Future<void> updateRecipe(Recipe recipe);
  Future<Recipe?> getRecipe(String id);
  Future<void> deleteRecipe(String id);
  Future<void> seedSampleRecipes();
}