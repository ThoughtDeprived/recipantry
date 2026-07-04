import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/recipes/presentation/providers/recipes_provider.dart';
import '../../data/repositories/drift_inventory_repository.dart';
import '../../data/repositories/drift_storage_space_repository.dart';
import '../../domain/models/inventory_item.dart';
import '../../domain/models/storage_space.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../../domain/repositories/storage_space_repository.dart';

final storageSpaceRepositoryProvider = Provider<StorageSpaceRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DriftStorageSpaceRepository(db);
});

final inventoryRepositoryProvider = Provider<InventoryRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DriftInventoryRepository(db);
});

final storageSpaceSeedProvider = FutureProvider<void>((ref) async {
  final repo = ref.watch(storageSpaceRepositoryProvider);
  await repo.seedDefaultSpaces();
});

final storageSpacesProvider = StreamProvider<List<StorageSpace>>((ref) {
  ref.watch(storageSpaceSeedProvider);
  final repo = ref.watch(storageSpaceRepositoryProvider);
  return repo.watchStorageSpaces();
});

final selectedStorageSpaceIdProvider = StateProvider<String?>((ref) => null);

final homeInventoryProvider = StreamProvider<List<InventoryItem>>((ref) {
  final repo = ref.watch(inventoryRepositoryProvider);
  final spaceId = ref.watch(selectedStorageSpaceIdProvider);
  return repo.watchInventory(storageSpaceId: spaceId);
});
