import '../models/ingredient_catalog.dart';

abstract class IngredientRepository {
  Stream<List<IngredientCatalogItem>> watchIngredients();
  Future<List<IngredientCatalogItem>> getIngredients();
  Future<IngredientCatalogItem?> getIngredient(String id);
  Future<void> addIngredient(IngredientCatalogItem ingredient);
  Future<void> updateIngredient(IngredientCatalogItem ingredient);
  Future<void> insertMissingSystemIngredientsFromJson();
}
