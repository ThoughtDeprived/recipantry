import 'package:drift/drift.dart';

import '../../../../core/db/app_database.dart';
import '../../domain/models/recipe.dart' as domain;
import '../../domain/repositories/recipe_repository.dart';

class DriftRecipeRepository implements RecipeRepository {
  final AppDatabase db;

  DriftRecipeRepository(this.db);

  @override
  Stream<List<domain.Recipe>> watchRecipes() {
    return db.select(db.recipes).watch().map(
          (rows) => rows
              .map(
                (r) => domain.Recipe(
                  id: r.id,
                  title: r.title,
                  servings: r.servings,
                  instructions: r.instructions,
                ),
              )
              .toList(),
        );
  }

  @override
  Future<void> addRecipe(domain.Recipe recipe) async {
    await db.into(db.recipes).insert(
          RecipesCompanion.insert(
            id: recipe.id,
            title: recipe.title,
            servings: Value(recipe.servings),
            instructions: recipe.instructions,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            updatedAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
  }

  @override
  Future<void> deleteRecipe(String id) async {
    await (db.delete(db.recipes)..where((t) => t.id.equals(id))).go();
  }
}