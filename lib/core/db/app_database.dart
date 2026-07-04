import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Recipes extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  RealColumn get servings => real().nullable()();
  TextColumn get instructions => text()();
  TextColumn get tags => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class RecipeIngredients extends Table {
  TextColumn get id => text()();
  TextColumn get recipeId => text().references(Recipes, #id)();
  TextColumn get ingredientId => text().nullable().references(IngredientCatalog, #id)();
  TextColumn get ingredientKey => text()();
  TextColumn get displayName => text()();
  RealColumn get quantity => real().nullable()();
  TextColumn get unit => text().nullable()();
  TextColumn get note => text().nullable()();
  IntColumn get sortOrder => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class IngredientSubstitutes extends Table {
  TextColumn get id => text()();
  TextColumn get recipeId => text().references(Recipes, #id)();
  TextColumn get recipeIngredientId => text().references(RecipeIngredients, #id)();
  TextColumn get substituteIngredientKey => text()();
  TextColumn get substituteDisplayName => text()();
  RealColumn get quantity => real().nullable()();
  TextColumn get unit => text().nullable()();
  TextColumn get note => text().nullable()();
  IntColumn get sortOrder => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class RecipeSteps extends Table {
  TextColumn get id => text()();
  TextColumn get recipeId => text().references(Recipes, #id)();
  TextColumn get sectionName => text().nullable()();
  IntColumn get stepNumber => integer()();
  TextColumn get instruction => text()();
  IntColumn get timerMinutes => integer().nullable()();
  IntColumn get sortOrder => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class IngredientCatalog extends Table {
  TextColumn get id => text()();
  TextColumn get ingredientKey => text().customConstraint('NOT NULL UNIQUE')();
  TextColumn get displayName => text()();
  TextColumn get defaultUnit => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get aliases => text().nullable()();
  BoolColumn get isSystem => boolean().withDefault(const Constant(false))();
  TextColumn get createdByUser => text().nullable()();
  TextColumn get defaultStorageSpaceId => text().nullable()();
  BoolColumn get isFood => boolean().withDefault(const Constant(true))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class MealPlans extends Table {
  TextColumn get id => text()();
  IntColumn get weekStartDate => integer()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class PlannedMeals extends Table {
  TextColumn get id => text()();
  TextColumn get mealPlanId =>
      text().references(MealPlans, #id, onDelete: KeyAction.cascade)();
  TextColumn get recipeId => text().references(Recipes, #id)();
  IntColumn get plannedDate => integer().nullable()();
  TextColumn get status => text().withDefault(const Constant('planned'))();
  IntColumn get cookedAt => integer().nullable()();
  RealColumn get servingsPlanned => real().nullable()();
  RealColumn get servingsRemaining => real().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class CookedMeals extends Table {
  TextColumn get id => text()();
  TextColumn get recipeId => text().references(Recipes, #id)();
  TextColumn get plannedMealId => text().nullable()();
  IntColumn get cookedAt => integer()();
  RealColumn get servingsCooked => real()();
  RealColumn get servingsRemaining => real()();
  IntColumn get estimatedGoodUntil => integer().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class StorageSpaces extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isSystem => boolean().withDefault(const Constant(false))();
  TextColumn get createdByUser => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class HomeInventoryItems extends Table {
  TextColumn get id => text()();
  TextColumn get itemCatalogId => text().nullable()();
  TextColumn get itemKey => text()();
  TextColumn get displayName => text()();
  RealColumn get quantity => real().withDefault(const Constant(1.0))();
  TextColumn get unit => text().nullable()();
  TextColumn get storageSpaceId => text().references(StorageSpaces, #id)();
  IntColumn get acquiredAt => integer().nullable()();
  IntColumn get openedAt => integer().nullable()();
  IntColumn get expiresAt => integer().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get sourceType => text().nullable()();
  BoolColumn get isConsumed => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class AppSettings extends Table {
  TextColumn get id => text()();
  TextColumn get key => text().customConstraint('NOT NULL UNIQUE')();
  TextColumn get value => text().nullable()();
  TextColumn get valueType => text().nullable()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  Recipes,
  RecipeIngredients,
  IngredientSubstitutes,
  RecipeSteps,
  IngredientCatalog,
  MealPlans,
  PlannedMeals,
  CookedMeals,
  StorageSpaces,
  HomeInventoryItems,
  AppSettings,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 8;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(recipeIngredients);
            await m.createTable(ingredientSubstitutes);
            await m.createTable(recipeSteps);
          }
          if (from < 3) {
            await m.createTable(ingredientCatalog);
          }
          if (from < 4) {
            await m.addColumn(recipeIngredients, recipeIngredients.ingredientId);
            await m.addColumn(ingredientCatalog, ingredientCatalog.isSystem);
            await m.addColumn(ingredientCatalog, ingredientCatalog.createdByUser);
          }
          if (from < 5) {
            await customStatement(
              'CREATE UNIQUE INDEX IF NOT EXISTS ingredient_catalog_ingredient_key_uq '
              'ON ingredient_catalog (ingredient_key)',
            );
          }
          if (from < 6) {
            await m.addColumn(recipes, recipes.tags);
            await m.createTable(mealPlans);
            await m.createTable(plannedMeals);
            await m.createTable(cookedMeals);
          }
          if (from < 7) {
            await m.createTable(storageSpaces);
            await m.createTable(homeInventoryItems);
            await m.addColumn(ingredientCatalog, ingredientCatalog.defaultStorageSpaceId);
            await m.addColumn(ingredientCatalog, ingredientCatalog.isFood);
          }
          if (from < 8) {
            await m.createTable(appSettings);
          }
        },
      );
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'recipantry_db',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.dart.js'),
    ),
  );
}