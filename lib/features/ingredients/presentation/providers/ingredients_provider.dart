import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../recipes/presentation/providers/recipes_provider.dart';
import '../../data/repositories/drift_ingredient_repository.dart';
import '../../domain/models/ingredient_catalog.dart';
import '../../domain/repositories/ingredient_repository.dart';

final ingredientRepositoryProvider = Provider<IngredientRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DriftIngredientRepository(db);
});

final ingredientCatalogInitializationProvider = FutureProvider<void>((ref) async {
  final repo = ref.watch(ingredientRepositoryProvider);
  await repo.insertMissingSystemIngredientsFromJson();
});

final ingredientsProvider = StreamProvider<List<IngredientCatalogItem>>((ref) {
  ref.watch(ingredientCatalogInitializationProvider);
  final repo = ref.watch(ingredientRepositoryProvider);
  return repo.watchIngredients();
});
