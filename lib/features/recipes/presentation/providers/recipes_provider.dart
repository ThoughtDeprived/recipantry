import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/db/app_database.dart';
import '../../data/repositories/drift_recipe_repository.dart';
import '../../domain/models/recipe.dart' as domain;
import '../../domain/repositories/recipe_repository.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DriftRecipeRepository(db);
});

final recipesProvider = StreamProvider<List<domain.Recipe>>((ref) {
  final repo = ref.watch(recipeRepositoryProvider);
  return repo.watchRecipes();
});