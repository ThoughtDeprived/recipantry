import 'package:drift/drift.dart';

import '../../../../core/db/app_database.dart';
import '../../domain/models/storage_space.dart' as d;
import '../../domain/repositories/storage_space_repository.dart';

class DriftStorageSpaceRepository implements StorageSpaceRepository {
  final AppDatabase db;

  DriftStorageSpaceRepository(this.db);

  static const List<(String, String, int)> _defaults = [
    ('fridge', 'Fridge', 0),
    ('pantry', 'Pantry', 1),
    ('freezer', 'Freezer', 2),
    ('spices', 'Spices', 3),
    ('beverages', 'Beverages', 4),
    ('other', 'Other', 5),
  ];

  d.StorageSpace _toModel(StorageSpace row) => d.StorageSpace(
        id: row.id,
        name: row.name,
        sortOrder: row.sortOrder,
        isSystem: row.isSystem,
        createdByUser: row.createdByUser,
        createdAt: DateTime.fromMillisecondsSinceEpoch(row.createdAt),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(row.updatedAt),
      );

  @override
  Stream<List<d.StorageSpace>> watchStorageSpaces() {
    return (db.select(db.storageSpaces)
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .watch()
        .map((rows) => rows.map(_toModel).toList());
  }

  @override
  Future<List<d.StorageSpace>> getStorageSpaces() async {
    final rows = await (db.select(db.storageSpaces)
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .get();
    return rows.map(_toModel).toList();
  }

  @override
  Future<d.StorageSpace?> getStorageSpaceByName(String name) async {
    final row = await (db.select(db.storageSpaces)
          ..where((t) => t.name.equals(name)))
        .getSingleOrNull();
    return row == null ? null : _toModel(row);
  }

  @override
  Future<void> seedDefaultSpaces() async {
    final existing = await db.select(db.storageSpaces).get();
    final existingIds = existing.map((s) => s.id).toSet();
    final now = DateTime.now().millisecondsSinceEpoch;

    for (final (id, name, sortOrder) in _defaults) {
      if (existingIds.contains(id)) continue;
      await db.into(db.storageSpaces).insert(StorageSpacesCompanion.insert(
        id: id,
        name: name,
        sortOrder: Value(sortOrder),
        isSystem: const Value(true),
        createdAt: now,
        updatedAt: now,
      ));
    }
  }
}
