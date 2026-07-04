class InventoryItem {
  final String id;
  final String? itemCatalogId;
  final String itemKey;
  final String displayName;
  final double quantity;
  final String? unit;
  final String storageSpaceId;
  final String? storageSpaceName;
  final DateTime? acquiredAt;
  final DateTime? openedAt;
  final DateTime? expiresAt;
  final String? notes;
  final String? sourceType;
  final bool isConsumed;
  final DateTime createdAt;
  final DateTime updatedAt;

  const InventoryItem({
    required this.id,
    this.itemCatalogId,
    required this.itemKey,
    required this.displayName,
    required this.quantity,
    this.unit,
    required this.storageSpaceId,
    this.storageSpaceName,
    this.acquiredAt,
    this.openedAt,
    this.expiresAt,
    this.notes,
    this.sourceType,
    required this.isConsumed,
    required this.createdAt,
    required this.updatedAt,
  });
}
