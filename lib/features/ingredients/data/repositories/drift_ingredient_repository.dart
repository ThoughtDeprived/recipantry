import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import '../../../../core/db/app_database.dart';
import '../../domain/models/ingredient_catalog.dart';
import '../../domain/repositories/ingredient_repository.dart';

class DriftIngredientRepository implements IngredientRepository {
  final AppDatabase db;

  DriftIngredientRepository(this.db);

  @override
  Stream<List<IngredientCatalogItem>> watchIngredients() {
    return db.select(db.ingredientCatalog).watch().map(
          (rows) => rows
              .map(
                (row) => IngredientCatalogItem(
                  id: row.id,
                  ingredientKey: row.ingredientKey,
                  displayName: row.displayName,
                  defaultUnit: row.defaultUnit,
                  category: row.category,
                  aliases: row.aliases,
                  isSystem: row.isSystem,
                  createdByUser: row.createdByUser,
                  defaultStorageSpaceId: row.defaultStorageSpaceId,
                  isFood: row.isFood,
                  createdAt: DateTime.fromMillisecondsSinceEpoch(row.createdAt),
                  updatedAt: DateTime.fromMillisecondsSinceEpoch(row.updatedAt),
                ),
              )
              .toList(),
        );
  }

  @override
  Future<List<IngredientCatalogItem>> getIngredients() async {
    final rows = await db.select(db.ingredientCatalog).get();
    return rows
        .map(
          (row) => IngredientCatalogItem(
            id: row.id,
            ingredientKey: row.ingredientKey,
            displayName: row.displayName,
            defaultUnit: row.defaultUnit,
            category: row.category,
            aliases: row.aliases,
            isSystem: row.isSystem,
            createdByUser: row.createdByUser,
            defaultStorageSpaceId: row.defaultStorageSpaceId,
            isFood: row.isFood,
            createdAt: DateTime.fromMillisecondsSinceEpoch(row.createdAt),
            updatedAt: DateTime.fromMillisecondsSinceEpoch(row.updatedAt),
          ),
        )
        .toList();
  }

  @override
  Future<IngredientCatalogItem?> getIngredient(String id) async {
    final row = await (db.select(db.ingredientCatalog)..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return IngredientCatalogItem(
      id: row.id,
      ingredientKey: row.ingredientKey,
      displayName: row.displayName,
      defaultUnit: row.defaultUnit,
      category: row.category,
      aliases: row.aliases,
      isSystem: row.isSystem,
      createdByUser: row.createdByUser,
      defaultStorageSpaceId: row.defaultStorageSpaceId,
      isFood: row.isFood,
      createdAt: DateTime.fromMillisecondsSinceEpoch(row.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(row.updatedAt),
    );
  }

  @override
  Future<void> addIngredient(IngredientCatalogItem ingredient) async {
    await db.into(db.ingredientCatalog).insert(
      IngredientCatalogCompanion.insert(
        id: ingredient.id,
        ingredientKey: ingredient.ingredientKey,
        displayName: ingredient.displayName,
        defaultUnit: Value(ingredient.defaultUnit),
        category: Value(ingredient.category),
        aliases: Value(ingredient.aliases),
        isSystem: Value(ingredient.isSystem),
        createdByUser: Value(ingredient.createdByUser),
        defaultStorageSpaceId: Value(ingredient.defaultStorageSpaceId),
        isFood: Value(ingredient.isFood),
        createdAt: ingredient.createdAt.millisecondsSinceEpoch,
        updatedAt: ingredient.updatedAt.millisecondsSinceEpoch,
      ),
    );
  }

  @override
  Future<void> updateIngredient(IngredientCatalogItem ingredient) async {
    await (db.update(db.ingredientCatalog)
          ..where((t) => t.id.equals(ingredient.id)))
        .write(
      IngredientCatalogCompanion(
        id: Value(ingredient.id),
        ingredientKey: Value(ingredient.ingredientKey),
        displayName: Value(ingredient.displayName),
        defaultUnit: Value(ingredient.defaultUnit),
        category: Value(ingredient.category),
        aliases: Value(ingredient.aliases),
        isSystem: Value(ingredient.isSystem),
        createdByUser: Value(ingredient.createdByUser),
        defaultStorageSpaceId: Value(ingredient.defaultStorageSpaceId),
        isFood: Value(ingredient.isFood),
        updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  static const Map<String, String> _categoryToStorageSpaceId = {
    'Produce': 'fridge',
    'Meat & Seafood': 'fridge',
    'Dairy': 'fridge',
    'Pantry': 'pantry',
    'Spices & Seasonings': 'spices',
    'Condiments & Sauces': 'pantry',
    'Canned Goods': 'pantry',
    'Frozen': 'freezer',
    'Bakery': 'pantry',
    'Beverages': 'beverages',
  };

  @override
  Future<void> insertMissingSystemIngredientsFromJson() async {
    final existing = await db.select(db.ingredientCatalog).get();
    final existingKeys = existing.map((row) => row.ingredientKey.toLowerCase()).toSet();

    final jsonString = await rootBundle.loadString('assets/data/ingredients.json');
    final rawList = jsonDecode(jsonString) as List<dynamic>;
    var insertedCount = 0;

    print('Ingredient preload: found ${rawList.length} items in assets/data/ingredients.json');

    await db.transaction(() async {
      for (final raw in rawList) {
        final item = IngredientCatalogItem.fromJson(raw as Map<String, dynamic>);
        final spaceId = _categoryToStorageSpaceId[item.category];

        if (existingKeys.contains(item.ingredientKey.toLowerCase())) {
          // Update storage space on existing rows if not already set.
          await (db.update(db.ingredientCatalog)
                ..where((t) => t.ingredientKey.equals(item.ingredientKey)))
              .write(IngredientCatalogCompanion(
                defaultStorageSpaceId: Value(spaceId),
                isFood: const Value(true),
              ));
          continue;
        }

        await addIngredient(
          IngredientCatalogItem(
            id: item.id,
            ingredientKey: item.ingredientKey,
            displayName: item.displayName,
            defaultUnit: item.defaultUnit,
            category: item.category,
            aliases: item.aliases,
            isSystem: true,
            createdByUser: null,
            defaultStorageSpaceId: spaceId,
            isFood: true,
            createdAt: item.createdAt,
            updatedAt: item.updatedAt,
          ),
        );
        insertedCount++;
        existingKeys.add(item.ingredientKey.toLowerCase());
      }
    });

    final totalCount = await db.select(db.ingredientCatalog).get().then((rows) => rows.length);
    print('Ingredient preload: inserted $insertedCount missing items');
    print('Ingredient preload: IngredientCatalog current count = $totalCount');
  }
}
