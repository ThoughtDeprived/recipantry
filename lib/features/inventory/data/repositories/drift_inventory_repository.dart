import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/db/app_database.dart';
import '../../domain/models/inventory_item.dart';
import '../../domain/repositories/inventory_repository.dart';

class DriftInventoryRepository implements InventoryRepository {
  final AppDatabase db;

  DriftInventoryRepository(this.db);

  InventoryItem _toModel(HomeInventoryItem inv, StorageSpace? space) =>
      InventoryItem(
        id: inv.id,
        itemCatalogId: inv.itemCatalogId,
        itemKey: inv.itemKey,
        displayName: inv.displayName,
        quantity: inv.quantity,
        unit: inv.unit,
        storageSpaceId: inv.storageSpaceId,
        storageSpaceName: space?.name,
        acquiredAt: inv.acquiredAt != null
            ? DateTime.fromMillisecondsSinceEpoch(inv.acquiredAt!)
            : null,
        openedAt: inv.openedAt != null
            ? DateTime.fromMillisecondsSinceEpoch(inv.openedAt!)
            : null,
        expiresAt: inv.expiresAt != null
            ? DateTime.fromMillisecondsSinceEpoch(inv.expiresAt!)
            : null,
        notes: inv.notes,
        sourceType: inv.sourceType,
        isConsumed: inv.isConsumed,
        createdAt: DateTime.fromMillisecondsSinceEpoch(inv.createdAt),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(inv.updatedAt),
      );

  @override
  Stream<List<InventoryItem>> watchInventory({String? storageSpaceId}) {
    final query = db.select(db.homeInventoryItems).join([
      leftOuterJoin(
        db.storageSpaces,
        db.storageSpaces.id.equalsExp(db.homeInventoryItems.storageSpaceId),
      ),
    ])
      ..where(storageSpaceId != null
          ? db.homeInventoryItems.storageSpaceId.equals(storageSpaceId) &
              db.homeInventoryItems.isConsumed.equals(false)
          : db.homeInventoryItems.isConsumed.equals(false))
      ..orderBy([OrderingTerm.asc(db.homeInventoryItems.displayName)]);

    return query.watch().map((rows) => rows
        .map((row) => _toModel(
              row.readTable(db.homeInventoryItems),
              row.readTableOrNull(db.storageSpaces),
            ))
        .toList());
  }

  @override
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
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await db.into(db.homeInventoryItems).insert(
      HomeInventoryItemsCompanion.insert(
        id: const Uuid().v4(),
        itemCatalogId: Value(itemCatalogId),
        itemKey: itemKey,
        displayName: displayName,
        quantity: Value(quantity),
        unit: Value(unit),
        storageSpaceId: storageSpaceId,
        acquiredAt: Value(now),
        sourceType: Value(sourceType ?? 'manual'),
        expiresAt: Value(expiresAt?.millisecondsSinceEpoch),
        notes: Value(notes),
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  @override
  Future<void> updateQuantity(String id, double quantity) async {
    await (db.update(db.homeInventoryItems)..where((t) => t.id.equals(id)))
        .write(HomeInventoryItemsCompanion(
          quantity: Value(quantity.clamp(0, double.infinity)),
          isConsumed: Value(quantity <= 0),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ));
  }

  @override
  Future<void> markConsumed(String id) async {
    await (db.update(db.homeInventoryItems)..where((t) => t.id.equals(id)))
        .write(HomeInventoryItemsCompanion(
          isConsumed: const Value(true),
          quantity: const Value(0),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ));
  }

  @override
  Future<void> removeInventoryItem(String id) async {
    await (db.delete(db.homeInventoryItems)..where((t) => t.id.equals(id)))
        .go();
  }
}
