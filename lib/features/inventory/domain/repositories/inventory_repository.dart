import '../models/inventory_item.dart';

abstract class InventoryRepository {
  Stream<List<InventoryItem>> watchInventory({String? storageSpaceId});
  Future<void> addInventoryItem({
    required String itemKey,
    required String displayName,
    required String storageSpaceId,
    String? itemCatalogId,
    double quantity = 1,
    String? unit,
    String? sourceType,
    DateTime? expiresAt,
    String? notes,
  });
  Future<void> updateQuantity(String id, double quantity);
  Future<void> markConsumed(String id);
  Future<void> removeInventoryItem(String id);
}
