import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/db/app_database.dart';

/// Simple key/value settings store backed by the Drift [AppSettings] table.
/// Values are persisted as strings; typed helpers handle conversion.
class AppSettingsRepository {
  final AppDatabase db;

  AppSettingsRepository(this.db);

  Future<Map<String, String>> loadAll() async {
    final rows = await db.select(db.appSettings).get();
    return {for (final row in rows) row.key: row.value ?? ''};
  }

  Stream<Map<String, String>> watchAll() {
    return db.select(db.appSettings).watch().map(
          (rows) => {for (final row in rows) row.key: row.value ?? ''},
        );
  }

  Future<void> setRaw(String key, String value, {String? valueType}) async {
    final existing = await (db.select(db.appSettings)
          ..where((t) => t.key.equals(key)))
        .getSingleOrNull();
    final now = DateTime.now().millisecondsSinceEpoch;

    if (existing == null) {
      await db.into(db.appSettings).insert(AppSettingsCompanion.insert(
            id: const Uuid().v4(),
            key: key,
            value: Value(value),
            valueType: Value(valueType),
            updatedAt: now,
          ));
    } else {
      await (db.update(db.appSettings)..where((t) => t.key.equals(key)))
          .write(AppSettingsCompanion(
        value: Value(value),
        valueType: Value(valueType),
        updatedAt: Value(now),
      ));
    }
  }

  Future<void> setString(String key, String value) =>
      setRaw(key, value, valueType: 'string');

  Future<void> setBool(String key, bool value) =>
      setRaw(key, value ? 'true' : 'false', valueType: 'bool');

  Future<void> setInt(String key, int value) =>
      setRaw(key, value.toString(), valueType: 'int');

  Future<void> setStringList(String key, List<String> value) =>
      setRaw(key, jsonEncode(value), valueType: 'stringList');

  static String? getString(Map<String, String> map, String key) => map[key];

  static bool getBool(Map<String, String> map, String key, bool fallback) {
    final v = map[key];
    if (v == null) return fallback;
    return v == 'true';
  }

  static int getInt(Map<String, String> map, String key, int fallback) {
    final v = map[key];
    if (v == null) return fallback;
    return int.tryParse(v) ?? fallback;
  }

  static List<String> getStringList(Map<String, String> map, String key) {
    final v = map[key];
    if (v == null || v.isEmpty) return const [];
    try {
      final decoded = jsonDecode(v);
      if (decoded is List) {
        return decoded.map((e) => e.toString()).toList();
      }
    } catch (_) {}
    return const [];
  }

  Future<void> clearAll() async {
    await db.delete(db.appSettings).go();
  }
}
