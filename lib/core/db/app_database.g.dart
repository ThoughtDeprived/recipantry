// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RecipesTable extends Recipes with TableInfo<$RecipesTable, Recipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _servingsMeta = const VerificationMeta(
    'servings',
  );
  @override
  late final GeneratedColumn<double> servings = GeneratedColumn<double>(
    'servings',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    servings,
    instructions,
    tags,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Recipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('servings')) {
      context.handle(
        _servingsMeta,
        servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_instructionsMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Recipe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      servings: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}servings'],
      ),
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }
}

class Recipe extends DataClass implements Insertable<Recipe> {
  final String id;
  final String title;
  final double? servings;
  final String instructions;
  final String? tags;
  final int createdAt;
  final int updatedAt;
  const Recipe({
    required this.id,
    required this.title,
    this.servings,
    required this.instructions,
    this.tags,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || servings != null) {
      map['servings'] = Variable<double>(servings);
    }
    map['instructions'] = Variable<String>(instructions);
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      title: Value(title),
      servings: servings == null && nullToAbsent
          ? const Value.absent()
          : Value(servings),
      instructions: Value(instructions),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Recipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Recipe(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      servings: serializer.fromJson<double?>(json['servings']),
      instructions: serializer.fromJson<String>(json['instructions']),
      tags: serializer.fromJson<String?>(json['tags']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'servings': serializer.toJson<double?>(servings),
      'instructions': serializer.toJson<String>(instructions),
      'tags': serializer.toJson<String?>(tags),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Recipe copyWith({
    String? id,
    String? title,
    Value<double?> servings = const Value.absent(),
    String? instructions,
    Value<String?> tags = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => Recipe(
    id: id ?? this.id,
    title: title ?? this.title,
    servings: servings.present ? servings.value : this.servings,
    instructions: instructions ?? this.instructions,
    tags: tags.present ? tags.value : this.tags,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Recipe copyWithCompanion(RecipesCompanion data) {
    return Recipe(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      servings: data.servings.present ? data.servings.value : this.servings,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Recipe(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('servings: $servings, ')
          ..write('instructions: $instructions, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    servings,
    instructions,
    tags,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recipe &&
          other.id == this.id &&
          other.title == this.title &&
          other.servings == this.servings &&
          other.instructions == this.instructions &&
          other.tags == this.tags &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RecipesCompanion extends UpdateCompanion<Recipe> {
  final Value<String> id;
  final Value<String> title;
  final Value<double?> servings;
  final Value<String> instructions;
  final Value<String?> tags;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.servings = const Value.absent(),
    this.instructions = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipesCompanion.insert({
    required String id,
    required String title,
    this.servings = const Value.absent(),
    required String instructions,
    this.tags = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       instructions = Value(instructions),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Recipe> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<double>? servings,
    Expression<String>? instructions,
    Expression<String>? tags,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (servings != null) 'servings': servings,
      if (instructions != null) 'instructions': instructions,
      if (tags != null) 'tags': tags,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<double?>? servings,
    Value<String>? instructions,
    Value<String?>? tags,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return RecipesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      servings: servings ?? this.servings,
      instructions: instructions ?? this.instructions,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (servings.present) {
      map['servings'] = Variable<double>(servings.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('servings: $servings, ')
          ..write('instructions: $instructions, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IngredientCatalogTable extends IngredientCatalog
    with TableInfo<$IngredientCatalogTable, IngredientCatalogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientCatalogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ingredientKeyMeta = const VerificationMeta(
    'ingredientKey',
  );
  @override
  late final GeneratedColumn<String> ingredientKey = GeneratedColumn<String>(
    'ingredient_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultUnitMeta = const VerificationMeta(
    'defaultUnit',
  );
  @override
  late final GeneratedColumn<String> defaultUnit = GeneratedColumn<String>(
    'default_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aliasesMeta = const VerificationMeta(
    'aliases',
  );
  @override
  late final GeneratedColumn<String> aliases = GeneratedColumn<String>(
    'aliases',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSystemMeta = const VerificationMeta(
    'isSystem',
  );
  @override
  late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>(
    'is_system',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_system" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdByUserMeta = const VerificationMeta(
    'createdByUser',
  );
  @override
  late final GeneratedColumn<String> createdByUser = GeneratedColumn<String>(
    'created_by_user',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultStorageSpaceIdMeta =
      const VerificationMeta('defaultStorageSpaceId');
  @override
  late final GeneratedColumn<String> defaultStorageSpaceId =
      GeneratedColumn<String>(
        'default_storage_space_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isFoodMeta = const VerificationMeta('isFood');
  @override
  late final GeneratedColumn<bool> isFood = GeneratedColumn<bool>(
    'is_food',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_food" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ingredientKey,
    displayName,
    defaultUnit,
    category,
    aliases,
    isSystem,
    createdByUser,
    defaultStorageSpaceId,
    isFood,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredient_catalog';
  @override
  VerificationContext validateIntegrity(
    Insertable<IngredientCatalogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('ingredient_key')) {
      context.handle(
        _ingredientKeyMeta,
        ingredientKey.isAcceptableOrUnknown(
          data['ingredient_key']!,
          _ingredientKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientKeyMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('default_unit')) {
      context.handle(
        _defaultUnitMeta,
        defaultUnit.isAcceptableOrUnknown(
          data['default_unit']!,
          _defaultUnitMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('aliases')) {
      context.handle(
        _aliasesMeta,
        aliases.isAcceptableOrUnknown(data['aliases']!, _aliasesMeta),
      );
    }
    if (data.containsKey('is_system')) {
      context.handle(
        _isSystemMeta,
        isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta),
      );
    }
    if (data.containsKey('created_by_user')) {
      context.handle(
        _createdByUserMeta,
        createdByUser.isAcceptableOrUnknown(
          data['created_by_user']!,
          _createdByUserMeta,
        ),
      );
    }
    if (data.containsKey('default_storage_space_id')) {
      context.handle(
        _defaultStorageSpaceIdMeta,
        defaultStorageSpaceId.isAcceptableOrUnknown(
          data['default_storage_space_id']!,
          _defaultStorageSpaceIdMeta,
        ),
      );
    }
    if (data.containsKey('is_food')) {
      context.handle(
        _isFoodMeta,
        isFood.isAcceptableOrUnknown(data['is_food']!, _isFoodMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IngredientCatalogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientCatalogData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ingredientKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredient_key'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      defaultUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_unit'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      aliases: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aliases'],
      ),
      isSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_system'],
      )!,
      createdByUser: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_user'],
      ),
      defaultStorageSpaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_storage_space_id'],
      ),
      isFood: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_food'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $IngredientCatalogTable createAlias(String alias) {
    return $IngredientCatalogTable(attachedDatabase, alias);
  }
}

class IngredientCatalogData extends DataClass
    implements Insertable<IngredientCatalogData> {
  final String id;
  final String ingredientKey;
  final String displayName;
  final String? defaultUnit;
  final String? category;
  final String? aliases;
  final bool isSystem;
  final String? createdByUser;
  final String? defaultStorageSpaceId;
  final bool isFood;
  final int createdAt;
  final int updatedAt;
  const IngredientCatalogData({
    required this.id,
    required this.ingredientKey,
    required this.displayName,
    this.defaultUnit,
    this.category,
    this.aliases,
    required this.isSystem,
    this.createdByUser,
    this.defaultStorageSpaceId,
    required this.isFood,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['ingredient_key'] = Variable<String>(ingredientKey);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || defaultUnit != null) {
      map['default_unit'] = Variable<String>(defaultUnit);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || aliases != null) {
      map['aliases'] = Variable<String>(aliases);
    }
    map['is_system'] = Variable<bool>(isSystem);
    if (!nullToAbsent || createdByUser != null) {
      map['created_by_user'] = Variable<String>(createdByUser);
    }
    if (!nullToAbsent || defaultStorageSpaceId != null) {
      map['default_storage_space_id'] = Variable<String>(defaultStorageSpaceId);
    }
    map['is_food'] = Variable<bool>(isFood);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  IngredientCatalogCompanion toCompanion(bool nullToAbsent) {
    return IngredientCatalogCompanion(
      id: Value(id),
      ingredientKey: Value(ingredientKey),
      displayName: Value(displayName),
      defaultUnit: defaultUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultUnit),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      aliases: aliases == null && nullToAbsent
          ? const Value.absent()
          : Value(aliases),
      isSystem: Value(isSystem),
      createdByUser: createdByUser == null && nullToAbsent
          ? const Value.absent()
          : Value(createdByUser),
      defaultStorageSpaceId: defaultStorageSpaceId == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultStorageSpaceId),
      isFood: Value(isFood),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory IngredientCatalogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientCatalogData(
      id: serializer.fromJson<String>(json['id']),
      ingredientKey: serializer.fromJson<String>(json['ingredientKey']),
      displayName: serializer.fromJson<String>(json['displayName']),
      defaultUnit: serializer.fromJson<String?>(json['defaultUnit']),
      category: serializer.fromJson<String?>(json['category']),
      aliases: serializer.fromJson<String?>(json['aliases']),
      isSystem: serializer.fromJson<bool>(json['isSystem']),
      createdByUser: serializer.fromJson<String?>(json['createdByUser']),
      defaultStorageSpaceId: serializer.fromJson<String?>(
        json['defaultStorageSpaceId'],
      ),
      isFood: serializer.fromJson<bool>(json['isFood']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ingredientKey': serializer.toJson<String>(ingredientKey),
      'displayName': serializer.toJson<String>(displayName),
      'defaultUnit': serializer.toJson<String?>(defaultUnit),
      'category': serializer.toJson<String?>(category),
      'aliases': serializer.toJson<String?>(aliases),
      'isSystem': serializer.toJson<bool>(isSystem),
      'createdByUser': serializer.toJson<String?>(createdByUser),
      'defaultStorageSpaceId': serializer.toJson<String?>(
        defaultStorageSpaceId,
      ),
      'isFood': serializer.toJson<bool>(isFood),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  IngredientCatalogData copyWith({
    String? id,
    String? ingredientKey,
    String? displayName,
    Value<String?> defaultUnit = const Value.absent(),
    Value<String?> category = const Value.absent(),
    Value<String?> aliases = const Value.absent(),
    bool? isSystem,
    Value<String?> createdByUser = const Value.absent(),
    Value<String?> defaultStorageSpaceId = const Value.absent(),
    bool? isFood,
    int? createdAt,
    int? updatedAt,
  }) => IngredientCatalogData(
    id: id ?? this.id,
    ingredientKey: ingredientKey ?? this.ingredientKey,
    displayName: displayName ?? this.displayName,
    defaultUnit: defaultUnit.present ? defaultUnit.value : this.defaultUnit,
    category: category.present ? category.value : this.category,
    aliases: aliases.present ? aliases.value : this.aliases,
    isSystem: isSystem ?? this.isSystem,
    createdByUser: createdByUser.present
        ? createdByUser.value
        : this.createdByUser,
    defaultStorageSpaceId: defaultStorageSpaceId.present
        ? defaultStorageSpaceId.value
        : this.defaultStorageSpaceId,
    isFood: isFood ?? this.isFood,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  IngredientCatalogData copyWithCompanion(IngredientCatalogCompanion data) {
    return IngredientCatalogData(
      id: data.id.present ? data.id.value : this.id,
      ingredientKey: data.ingredientKey.present
          ? data.ingredientKey.value
          : this.ingredientKey,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      defaultUnit: data.defaultUnit.present
          ? data.defaultUnit.value
          : this.defaultUnit,
      category: data.category.present ? data.category.value : this.category,
      aliases: data.aliases.present ? data.aliases.value : this.aliases,
      isSystem: data.isSystem.present ? data.isSystem.value : this.isSystem,
      createdByUser: data.createdByUser.present
          ? data.createdByUser.value
          : this.createdByUser,
      defaultStorageSpaceId: data.defaultStorageSpaceId.present
          ? data.defaultStorageSpaceId.value
          : this.defaultStorageSpaceId,
      isFood: data.isFood.present ? data.isFood.value : this.isFood,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientCatalogData(')
          ..write('id: $id, ')
          ..write('ingredientKey: $ingredientKey, ')
          ..write('displayName: $displayName, ')
          ..write('defaultUnit: $defaultUnit, ')
          ..write('category: $category, ')
          ..write('aliases: $aliases, ')
          ..write('isSystem: $isSystem, ')
          ..write('createdByUser: $createdByUser, ')
          ..write('defaultStorageSpaceId: $defaultStorageSpaceId, ')
          ..write('isFood: $isFood, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ingredientKey,
    displayName,
    defaultUnit,
    category,
    aliases,
    isSystem,
    createdByUser,
    defaultStorageSpaceId,
    isFood,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientCatalogData &&
          other.id == this.id &&
          other.ingredientKey == this.ingredientKey &&
          other.displayName == this.displayName &&
          other.defaultUnit == this.defaultUnit &&
          other.category == this.category &&
          other.aliases == this.aliases &&
          other.isSystem == this.isSystem &&
          other.createdByUser == this.createdByUser &&
          other.defaultStorageSpaceId == this.defaultStorageSpaceId &&
          other.isFood == this.isFood &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class IngredientCatalogCompanion
    extends UpdateCompanion<IngredientCatalogData> {
  final Value<String> id;
  final Value<String> ingredientKey;
  final Value<String> displayName;
  final Value<String?> defaultUnit;
  final Value<String?> category;
  final Value<String?> aliases;
  final Value<bool> isSystem;
  final Value<String?> createdByUser;
  final Value<String?> defaultStorageSpaceId;
  final Value<bool> isFood;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const IngredientCatalogCompanion({
    this.id = const Value.absent(),
    this.ingredientKey = const Value.absent(),
    this.displayName = const Value.absent(),
    this.defaultUnit = const Value.absent(),
    this.category = const Value.absent(),
    this.aliases = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.createdByUser = const Value.absent(),
    this.defaultStorageSpaceId = const Value.absent(),
    this.isFood = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IngredientCatalogCompanion.insert({
    required String id,
    required String ingredientKey,
    required String displayName,
    this.defaultUnit = const Value.absent(),
    this.category = const Value.absent(),
    this.aliases = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.createdByUser = const Value.absent(),
    this.defaultStorageSpaceId = const Value.absent(),
    this.isFood = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ingredientKey = Value(ingredientKey),
       displayName = Value(displayName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<IngredientCatalogData> custom({
    Expression<String>? id,
    Expression<String>? ingredientKey,
    Expression<String>? displayName,
    Expression<String>? defaultUnit,
    Expression<String>? category,
    Expression<String>? aliases,
    Expression<bool>? isSystem,
    Expression<String>? createdByUser,
    Expression<String>? defaultStorageSpaceId,
    Expression<bool>? isFood,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ingredientKey != null) 'ingredient_key': ingredientKey,
      if (displayName != null) 'display_name': displayName,
      if (defaultUnit != null) 'default_unit': defaultUnit,
      if (category != null) 'category': category,
      if (aliases != null) 'aliases': aliases,
      if (isSystem != null) 'is_system': isSystem,
      if (createdByUser != null) 'created_by_user': createdByUser,
      if (defaultStorageSpaceId != null)
        'default_storage_space_id': defaultStorageSpaceId,
      if (isFood != null) 'is_food': isFood,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IngredientCatalogCompanion copyWith({
    Value<String>? id,
    Value<String>? ingredientKey,
    Value<String>? displayName,
    Value<String?>? defaultUnit,
    Value<String?>? category,
    Value<String?>? aliases,
    Value<bool>? isSystem,
    Value<String?>? createdByUser,
    Value<String?>? defaultStorageSpaceId,
    Value<bool>? isFood,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return IngredientCatalogCompanion(
      id: id ?? this.id,
      ingredientKey: ingredientKey ?? this.ingredientKey,
      displayName: displayName ?? this.displayName,
      defaultUnit: defaultUnit ?? this.defaultUnit,
      category: category ?? this.category,
      aliases: aliases ?? this.aliases,
      isSystem: isSystem ?? this.isSystem,
      createdByUser: createdByUser ?? this.createdByUser,
      defaultStorageSpaceId:
          defaultStorageSpaceId ?? this.defaultStorageSpaceId,
      isFood: isFood ?? this.isFood,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ingredientKey.present) {
      map['ingredient_key'] = Variable<String>(ingredientKey.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (defaultUnit.present) {
      map['default_unit'] = Variable<String>(defaultUnit.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (aliases.present) {
      map['aliases'] = Variable<String>(aliases.value);
    }
    if (isSystem.present) {
      map['is_system'] = Variable<bool>(isSystem.value);
    }
    if (createdByUser.present) {
      map['created_by_user'] = Variable<String>(createdByUser.value);
    }
    if (defaultStorageSpaceId.present) {
      map['default_storage_space_id'] = Variable<String>(
        defaultStorageSpaceId.value,
      );
    }
    if (isFood.present) {
      map['is_food'] = Variable<bool>(isFood.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientCatalogCompanion(')
          ..write('id: $id, ')
          ..write('ingredientKey: $ingredientKey, ')
          ..write('displayName: $displayName, ')
          ..write('defaultUnit: $defaultUnit, ')
          ..write('category: $category, ')
          ..write('aliases: $aliases, ')
          ..write('isSystem: $isSystem, ')
          ..write('createdByUser: $createdByUser, ')
          ..write('defaultStorageSpaceId: $defaultStorageSpaceId, ')
          ..write('isFood: $isFood, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeIngredientsTable extends RecipeIngredients
    with TableInfo<$RecipeIngredientsTable, RecipeIngredient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeIngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<String> ingredientId = GeneratedColumn<String>(
    'ingredient_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ingredient_catalog (id)',
    ),
  );
  static const VerificationMeta _ingredientKeyMeta = const VerificationMeta(
    'ingredientKey',
  );
  @override
  late final GeneratedColumn<String> ingredientKey = GeneratedColumn<String>(
    'ingredient_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    ingredientId,
    ingredientKey,
    displayName,
    quantity,
    unit,
    note,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeIngredient> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    }
    if (data.containsKey('ingredient_key')) {
      context.handle(
        _ingredientKeyMeta,
        ingredientKey.isAcceptableOrUnknown(
          data['ingredient_key']!,
          _ingredientKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientKeyMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeIngredient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeIngredient(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredient_id'],
      ),
      ingredientKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredient_key'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $RecipeIngredientsTable createAlias(String alias) {
    return $RecipeIngredientsTable(attachedDatabase, alias);
  }
}

class RecipeIngredient extends DataClass
    implements Insertable<RecipeIngredient> {
  final String id;
  final String recipeId;
  final String? ingredientId;
  final String ingredientKey;
  final String displayName;
  final double? quantity;
  final String? unit;
  final String? note;
  final int sortOrder;
  const RecipeIngredient({
    required this.id,
    required this.recipeId,
    this.ingredientId,
    required this.ingredientKey,
    required this.displayName,
    this.quantity,
    this.unit,
    this.note,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recipe_id'] = Variable<String>(recipeId);
    if (!nullToAbsent || ingredientId != null) {
      map['ingredient_id'] = Variable<String>(ingredientId);
    }
    map['ingredient_key'] = Variable<String>(ingredientKey);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  RecipeIngredientsCompanion toCompanion(bool nullToAbsent) {
    return RecipeIngredientsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      ingredientId: ingredientId == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredientId),
      ingredientKey: Value(ingredientKey),
      displayName: Value(displayName),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      sortOrder: Value(sortOrder),
    );
  }

  factory RecipeIngredient.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeIngredient(
      id: serializer.fromJson<String>(json['id']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      ingredientId: serializer.fromJson<String?>(json['ingredientId']),
      ingredientKey: serializer.fromJson<String>(json['ingredientKey']),
      displayName: serializer.fromJson<String>(json['displayName']),
      quantity: serializer.fromJson<double?>(json['quantity']),
      unit: serializer.fromJson<String?>(json['unit']),
      note: serializer.fromJson<String?>(json['note']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recipeId': serializer.toJson<String>(recipeId),
      'ingredientId': serializer.toJson<String?>(ingredientId),
      'ingredientKey': serializer.toJson<String>(ingredientKey),
      'displayName': serializer.toJson<String>(displayName),
      'quantity': serializer.toJson<double?>(quantity),
      'unit': serializer.toJson<String?>(unit),
      'note': serializer.toJson<String?>(note),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  RecipeIngredient copyWith({
    String? id,
    String? recipeId,
    Value<String?> ingredientId = const Value.absent(),
    String? ingredientKey,
    String? displayName,
    Value<double?> quantity = const Value.absent(),
    Value<String?> unit = const Value.absent(),
    Value<String?> note = const Value.absent(),
    int? sortOrder,
  }) => RecipeIngredient(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    ingredientId: ingredientId.present ? ingredientId.value : this.ingredientId,
    ingredientKey: ingredientKey ?? this.ingredientKey,
    displayName: displayName ?? this.displayName,
    quantity: quantity.present ? quantity.value : this.quantity,
    unit: unit.present ? unit.value : this.unit,
    note: note.present ? note.value : this.note,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  RecipeIngredient copyWithCompanion(RecipeIngredientsCompanion data) {
    return RecipeIngredient(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      ingredientKey: data.ingredientKey.present
          ? data.ingredientKey.value
          : this.ingredientKey,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unit: data.unit.present ? data.unit.value : this.unit,
      note: data.note.present ? data.note.value : this.note,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredient(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('ingredientKey: $ingredientKey, ')
          ..write('displayName: $displayName, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('note: $note, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recipeId,
    ingredientId,
    ingredientKey,
    displayName,
    quantity,
    unit,
    note,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeIngredient &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.ingredientId == this.ingredientId &&
          other.ingredientKey == this.ingredientKey &&
          other.displayName == this.displayName &&
          other.quantity == this.quantity &&
          other.unit == this.unit &&
          other.note == this.note &&
          other.sortOrder == this.sortOrder);
}

class RecipeIngredientsCompanion extends UpdateCompanion<RecipeIngredient> {
  final Value<String> id;
  final Value<String> recipeId;
  final Value<String?> ingredientId;
  final Value<String> ingredientKey;
  final Value<String> displayName;
  final Value<double?> quantity;
  final Value<String?> unit;
  final Value<String?> note;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const RecipeIngredientsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.ingredientKey = const Value.absent(),
    this.displayName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.note = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeIngredientsCompanion.insert({
    required String id,
    required String recipeId,
    this.ingredientId = const Value.absent(),
    required String ingredientKey,
    required String displayName,
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.note = const Value.absent(),
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       recipeId = Value(recipeId),
       ingredientKey = Value(ingredientKey),
       displayName = Value(displayName),
       sortOrder = Value(sortOrder);
  static Insertable<RecipeIngredient> custom({
    Expression<String>? id,
    Expression<String>? recipeId,
    Expression<String>? ingredientId,
    Expression<String>? ingredientKey,
    Expression<String>? displayName,
    Expression<double>? quantity,
    Expression<String>? unit,
    Expression<String>? note,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (ingredientKey != null) 'ingredient_key': ingredientKey,
      if (displayName != null) 'display_name': displayName,
      if (quantity != null) 'quantity': quantity,
      if (unit != null) 'unit': unit,
      if (note != null) 'note': note,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeIngredientsCompanion copyWith({
    Value<String>? id,
    Value<String>? recipeId,
    Value<String?>? ingredientId,
    Value<String>? ingredientKey,
    Value<String>? displayName,
    Value<double?>? quantity,
    Value<String?>? unit,
    Value<String?>? note,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return RecipeIngredientsCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      ingredientId: ingredientId ?? this.ingredientId,
      ingredientKey: ingredientKey ?? this.ingredientKey,
      displayName: displayName ?? this.displayName,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      note: note ?? this.note,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<String>(ingredientId.value);
    }
    if (ingredientKey.present) {
      map['ingredient_key'] = Variable<String>(ingredientKey.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('ingredientKey: $ingredientKey, ')
          ..write('displayName: $displayName, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('note: $note, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IngredientSubstitutesTable extends IngredientSubstitutes
    with TableInfo<$IngredientSubstitutesTable, IngredientSubstitute> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientSubstitutesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _recipeIngredientIdMeta =
      const VerificationMeta('recipeIngredientId');
  @override
  late final GeneratedColumn<String> recipeIngredientId =
      GeneratedColumn<String>(
        'recipe_ingredient_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recipe_ingredients (id)',
        ),
      );
  static const VerificationMeta _substituteIngredientKeyMeta =
      const VerificationMeta('substituteIngredientKey');
  @override
  late final GeneratedColumn<String> substituteIngredientKey =
      GeneratedColumn<String>(
        'substitute_ingredient_key',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _substituteDisplayNameMeta =
      const VerificationMeta('substituteDisplayName');
  @override
  late final GeneratedColumn<String> substituteDisplayName =
      GeneratedColumn<String>(
        'substitute_display_name',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    recipeIngredientId,
    substituteIngredientKey,
    substituteDisplayName,
    quantity,
    unit,
    note,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredient_substitutes';
  @override
  VerificationContext validateIntegrity(
    Insertable<IngredientSubstitute> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('recipe_ingredient_id')) {
      context.handle(
        _recipeIngredientIdMeta,
        recipeIngredientId.isAcceptableOrUnknown(
          data['recipe_ingredient_id']!,
          _recipeIngredientIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recipeIngredientIdMeta);
    }
    if (data.containsKey('substitute_ingredient_key')) {
      context.handle(
        _substituteIngredientKeyMeta,
        substituteIngredientKey.isAcceptableOrUnknown(
          data['substitute_ingredient_key']!,
          _substituteIngredientKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_substituteIngredientKeyMeta);
    }
    if (data.containsKey('substitute_display_name')) {
      context.handle(
        _substituteDisplayNameMeta,
        substituteDisplayName.isAcceptableOrUnknown(
          data['substitute_display_name']!,
          _substituteDisplayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_substituteDisplayNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IngredientSubstitute map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientSubstitute(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      recipeIngredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_ingredient_id'],
      )!,
      substituteIngredientKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}substitute_ingredient_key'],
      )!,
      substituteDisplayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}substitute_display_name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $IngredientSubstitutesTable createAlias(String alias) {
    return $IngredientSubstitutesTable(attachedDatabase, alias);
  }
}

class IngredientSubstitute extends DataClass
    implements Insertable<IngredientSubstitute> {
  final String id;
  final String recipeId;
  final String recipeIngredientId;
  final String substituteIngredientKey;
  final String substituteDisplayName;
  final double? quantity;
  final String? unit;
  final String? note;
  final int sortOrder;
  const IngredientSubstitute({
    required this.id,
    required this.recipeId,
    required this.recipeIngredientId,
    required this.substituteIngredientKey,
    required this.substituteDisplayName,
    this.quantity,
    this.unit,
    this.note,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recipe_id'] = Variable<String>(recipeId);
    map['recipe_ingredient_id'] = Variable<String>(recipeIngredientId);
    map['substitute_ingredient_key'] = Variable<String>(
      substituteIngredientKey,
    );
    map['substitute_display_name'] = Variable<String>(substituteDisplayName);
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  IngredientSubstitutesCompanion toCompanion(bool nullToAbsent) {
    return IngredientSubstitutesCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      recipeIngredientId: Value(recipeIngredientId),
      substituteIngredientKey: Value(substituteIngredientKey),
      substituteDisplayName: Value(substituteDisplayName),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      sortOrder: Value(sortOrder),
    );
  }

  factory IngredientSubstitute.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientSubstitute(
      id: serializer.fromJson<String>(json['id']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      recipeIngredientId: serializer.fromJson<String>(
        json['recipeIngredientId'],
      ),
      substituteIngredientKey: serializer.fromJson<String>(
        json['substituteIngredientKey'],
      ),
      substituteDisplayName: serializer.fromJson<String>(
        json['substituteDisplayName'],
      ),
      quantity: serializer.fromJson<double?>(json['quantity']),
      unit: serializer.fromJson<String?>(json['unit']),
      note: serializer.fromJson<String?>(json['note']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recipeId': serializer.toJson<String>(recipeId),
      'recipeIngredientId': serializer.toJson<String>(recipeIngredientId),
      'substituteIngredientKey': serializer.toJson<String>(
        substituteIngredientKey,
      ),
      'substituteDisplayName': serializer.toJson<String>(substituteDisplayName),
      'quantity': serializer.toJson<double?>(quantity),
      'unit': serializer.toJson<String?>(unit),
      'note': serializer.toJson<String?>(note),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  IngredientSubstitute copyWith({
    String? id,
    String? recipeId,
    String? recipeIngredientId,
    String? substituteIngredientKey,
    String? substituteDisplayName,
    Value<double?> quantity = const Value.absent(),
    Value<String?> unit = const Value.absent(),
    Value<String?> note = const Value.absent(),
    int? sortOrder,
  }) => IngredientSubstitute(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    recipeIngredientId: recipeIngredientId ?? this.recipeIngredientId,
    substituteIngredientKey:
        substituteIngredientKey ?? this.substituteIngredientKey,
    substituteDisplayName: substituteDisplayName ?? this.substituteDisplayName,
    quantity: quantity.present ? quantity.value : this.quantity,
    unit: unit.present ? unit.value : this.unit,
    note: note.present ? note.value : this.note,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  IngredientSubstitute copyWithCompanion(IngredientSubstitutesCompanion data) {
    return IngredientSubstitute(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      recipeIngredientId: data.recipeIngredientId.present
          ? data.recipeIngredientId.value
          : this.recipeIngredientId,
      substituteIngredientKey: data.substituteIngredientKey.present
          ? data.substituteIngredientKey.value
          : this.substituteIngredientKey,
      substituteDisplayName: data.substituteDisplayName.present
          ? data.substituteDisplayName.value
          : this.substituteDisplayName,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unit: data.unit.present ? data.unit.value : this.unit,
      note: data.note.present ? data.note.value : this.note,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientSubstitute(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('recipeIngredientId: $recipeIngredientId, ')
          ..write('substituteIngredientKey: $substituteIngredientKey, ')
          ..write('substituteDisplayName: $substituteDisplayName, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('note: $note, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recipeId,
    recipeIngredientId,
    substituteIngredientKey,
    substituteDisplayName,
    quantity,
    unit,
    note,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientSubstitute &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.recipeIngredientId == this.recipeIngredientId &&
          other.substituteIngredientKey == this.substituteIngredientKey &&
          other.substituteDisplayName == this.substituteDisplayName &&
          other.quantity == this.quantity &&
          other.unit == this.unit &&
          other.note == this.note &&
          other.sortOrder == this.sortOrder);
}

class IngredientSubstitutesCompanion
    extends UpdateCompanion<IngredientSubstitute> {
  final Value<String> id;
  final Value<String> recipeId;
  final Value<String> recipeIngredientId;
  final Value<String> substituteIngredientKey;
  final Value<String> substituteDisplayName;
  final Value<double?> quantity;
  final Value<String?> unit;
  final Value<String?> note;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const IngredientSubstitutesCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.recipeIngredientId = const Value.absent(),
    this.substituteIngredientKey = const Value.absent(),
    this.substituteDisplayName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.note = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IngredientSubstitutesCompanion.insert({
    required String id,
    required String recipeId,
    required String recipeIngredientId,
    required String substituteIngredientKey,
    required String substituteDisplayName,
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.note = const Value.absent(),
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       recipeId = Value(recipeId),
       recipeIngredientId = Value(recipeIngredientId),
       substituteIngredientKey = Value(substituteIngredientKey),
       substituteDisplayName = Value(substituteDisplayName),
       sortOrder = Value(sortOrder);
  static Insertable<IngredientSubstitute> custom({
    Expression<String>? id,
    Expression<String>? recipeId,
    Expression<String>? recipeIngredientId,
    Expression<String>? substituteIngredientKey,
    Expression<String>? substituteDisplayName,
    Expression<double>? quantity,
    Expression<String>? unit,
    Expression<String>? note,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (recipeIngredientId != null)
        'recipe_ingredient_id': recipeIngredientId,
      if (substituteIngredientKey != null)
        'substitute_ingredient_key': substituteIngredientKey,
      if (substituteDisplayName != null)
        'substitute_display_name': substituteDisplayName,
      if (quantity != null) 'quantity': quantity,
      if (unit != null) 'unit': unit,
      if (note != null) 'note': note,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IngredientSubstitutesCompanion copyWith({
    Value<String>? id,
    Value<String>? recipeId,
    Value<String>? recipeIngredientId,
    Value<String>? substituteIngredientKey,
    Value<String>? substituteDisplayName,
    Value<double?>? quantity,
    Value<String?>? unit,
    Value<String?>? note,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return IngredientSubstitutesCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      recipeIngredientId: recipeIngredientId ?? this.recipeIngredientId,
      substituteIngredientKey:
          substituteIngredientKey ?? this.substituteIngredientKey,
      substituteDisplayName:
          substituteDisplayName ?? this.substituteDisplayName,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      note: note ?? this.note,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (recipeIngredientId.present) {
      map['recipe_ingredient_id'] = Variable<String>(recipeIngredientId.value);
    }
    if (substituteIngredientKey.present) {
      map['substitute_ingredient_key'] = Variable<String>(
        substituteIngredientKey.value,
      );
    }
    if (substituteDisplayName.present) {
      map['substitute_display_name'] = Variable<String>(
        substituteDisplayName.value,
      );
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientSubstitutesCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('recipeIngredientId: $recipeIngredientId, ')
          ..write('substituteIngredientKey: $substituteIngredientKey, ')
          ..write('substituteDisplayName: $substituteDisplayName, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('note: $note, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeStepsTable extends RecipeSteps
    with TableInfo<$RecipeStepsTable, RecipeStep> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeStepsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _sectionNameMeta = const VerificationMeta(
    'sectionName',
  );
  @override
  late final GeneratedColumn<String> sectionName = GeneratedColumn<String>(
    'section_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stepNumberMeta = const VerificationMeta(
    'stepNumber',
  );
  @override
  late final GeneratedColumn<int> stepNumber = GeneratedColumn<int>(
    'step_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _instructionMeta = const VerificationMeta(
    'instruction',
  );
  @override
  late final GeneratedColumn<String> instruction = GeneratedColumn<String>(
    'instruction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timerMinutesMeta = const VerificationMeta(
    'timerMinutes',
  );
  @override
  late final GeneratedColumn<int> timerMinutes = GeneratedColumn<int>(
    'timer_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    sectionName,
    stepNumber,
    instruction,
    timerMinutes,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeStep> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('section_name')) {
      context.handle(
        _sectionNameMeta,
        sectionName.isAcceptableOrUnknown(
          data['section_name']!,
          _sectionNameMeta,
        ),
      );
    }
    if (data.containsKey('step_number')) {
      context.handle(
        _stepNumberMeta,
        stepNumber.isAcceptableOrUnknown(data['step_number']!, _stepNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_stepNumberMeta);
    }
    if (data.containsKey('instruction')) {
      context.handle(
        _instructionMeta,
        instruction.isAcceptableOrUnknown(
          data['instruction']!,
          _instructionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_instructionMeta);
    }
    if (data.containsKey('timer_minutes')) {
      context.handle(
        _timerMinutesMeta,
        timerMinutes.isAcceptableOrUnknown(
          data['timer_minutes']!,
          _timerMinutesMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeStep map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeStep(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      sectionName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section_name'],
      ),
      stepNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}step_number'],
      )!,
      instruction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instruction'],
      )!,
      timerMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timer_minutes'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $RecipeStepsTable createAlias(String alias) {
    return $RecipeStepsTable(attachedDatabase, alias);
  }
}

class RecipeStep extends DataClass implements Insertable<RecipeStep> {
  final String id;
  final String recipeId;
  final String? sectionName;
  final int stepNumber;
  final String instruction;
  final int? timerMinutes;
  final int sortOrder;
  const RecipeStep({
    required this.id,
    required this.recipeId,
    this.sectionName,
    required this.stepNumber,
    required this.instruction,
    this.timerMinutes,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recipe_id'] = Variable<String>(recipeId);
    if (!nullToAbsent || sectionName != null) {
      map['section_name'] = Variable<String>(sectionName);
    }
    map['step_number'] = Variable<int>(stepNumber);
    map['instruction'] = Variable<String>(instruction);
    if (!nullToAbsent || timerMinutes != null) {
      map['timer_minutes'] = Variable<int>(timerMinutes);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  RecipeStepsCompanion toCompanion(bool nullToAbsent) {
    return RecipeStepsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      sectionName: sectionName == null && nullToAbsent
          ? const Value.absent()
          : Value(sectionName),
      stepNumber: Value(stepNumber),
      instruction: Value(instruction),
      timerMinutes: timerMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(timerMinutes),
      sortOrder: Value(sortOrder),
    );
  }

  factory RecipeStep.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeStep(
      id: serializer.fromJson<String>(json['id']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      sectionName: serializer.fromJson<String?>(json['sectionName']),
      stepNumber: serializer.fromJson<int>(json['stepNumber']),
      instruction: serializer.fromJson<String>(json['instruction']),
      timerMinutes: serializer.fromJson<int?>(json['timerMinutes']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recipeId': serializer.toJson<String>(recipeId),
      'sectionName': serializer.toJson<String?>(sectionName),
      'stepNumber': serializer.toJson<int>(stepNumber),
      'instruction': serializer.toJson<String>(instruction),
      'timerMinutes': serializer.toJson<int?>(timerMinutes),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  RecipeStep copyWith({
    String? id,
    String? recipeId,
    Value<String?> sectionName = const Value.absent(),
    int? stepNumber,
    String? instruction,
    Value<int?> timerMinutes = const Value.absent(),
    int? sortOrder,
  }) => RecipeStep(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    sectionName: sectionName.present ? sectionName.value : this.sectionName,
    stepNumber: stepNumber ?? this.stepNumber,
    instruction: instruction ?? this.instruction,
    timerMinutes: timerMinutes.present ? timerMinutes.value : this.timerMinutes,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  RecipeStep copyWithCompanion(RecipeStepsCompanion data) {
    return RecipeStep(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      sectionName: data.sectionName.present
          ? data.sectionName.value
          : this.sectionName,
      stepNumber: data.stepNumber.present
          ? data.stepNumber.value
          : this.stepNumber,
      instruction: data.instruction.present
          ? data.instruction.value
          : this.instruction,
      timerMinutes: data.timerMinutes.present
          ? data.timerMinutes.value
          : this.timerMinutes,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStep(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('sectionName: $sectionName, ')
          ..write('stepNumber: $stepNumber, ')
          ..write('instruction: $instruction, ')
          ..write('timerMinutes: $timerMinutes, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recipeId,
    sectionName,
    stepNumber,
    instruction,
    timerMinutes,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeStep &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.sectionName == this.sectionName &&
          other.stepNumber == this.stepNumber &&
          other.instruction == this.instruction &&
          other.timerMinutes == this.timerMinutes &&
          other.sortOrder == this.sortOrder);
}

class RecipeStepsCompanion extends UpdateCompanion<RecipeStep> {
  final Value<String> id;
  final Value<String> recipeId;
  final Value<String?> sectionName;
  final Value<int> stepNumber;
  final Value<String> instruction;
  final Value<int?> timerMinutes;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const RecipeStepsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.sectionName = const Value.absent(),
    this.stepNumber = const Value.absent(),
    this.instruction = const Value.absent(),
    this.timerMinutes = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeStepsCompanion.insert({
    required String id,
    required String recipeId,
    this.sectionName = const Value.absent(),
    required int stepNumber,
    required String instruction,
    this.timerMinutes = const Value.absent(),
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       recipeId = Value(recipeId),
       stepNumber = Value(stepNumber),
       instruction = Value(instruction),
       sortOrder = Value(sortOrder);
  static Insertable<RecipeStep> custom({
    Expression<String>? id,
    Expression<String>? recipeId,
    Expression<String>? sectionName,
    Expression<int>? stepNumber,
    Expression<String>? instruction,
    Expression<int>? timerMinutes,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (sectionName != null) 'section_name': sectionName,
      if (stepNumber != null) 'step_number': stepNumber,
      if (instruction != null) 'instruction': instruction,
      if (timerMinutes != null) 'timer_minutes': timerMinutes,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeStepsCompanion copyWith({
    Value<String>? id,
    Value<String>? recipeId,
    Value<String?>? sectionName,
    Value<int>? stepNumber,
    Value<String>? instruction,
    Value<int?>? timerMinutes,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return RecipeStepsCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      sectionName: sectionName ?? this.sectionName,
      stepNumber: stepNumber ?? this.stepNumber,
      instruction: instruction ?? this.instruction,
      timerMinutes: timerMinutes ?? this.timerMinutes,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (sectionName.present) {
      map['section_name'] = Variable<String>(sectionName.value);
    }
    if (stepNumber.present) {
      map['step_number'] = Variable<int>(stepNumber.value);
    }
    if (instruction.present) {
      map['instruction'] = Variable<String>(instruction.value);
    }
    if (timerMinutes.present) {
      map['timer_minutes'] = Variable<int>(timerMinutes.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStepsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('sectionName: $sectionName, ')
          ..write('stepNumber: $stepNumber, ')
          ..write('instruction: $instruction, ')
          ..write('timerMinutes: $timerMinutes, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealPlansTable extends MealPlans
    with TableInfo<$MealPlansTable, MealPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekStartDateMeta = const VerificationMeta(
    'weekStartDate',
  );
  @override
  late final GeneratedColumn<int> weekStartDate = GeneratedColumn<int>(
    'week_start_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weekStartDate,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealPlan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('week_start_date')) {
      context.handle(
        _weekStartDateMeta,
        weekStartDate.isAcceptableOrUnknown(
          data['week_start_date']!,
          _weekStartDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weekStartDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealPlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      weekStartDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}week_start_date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MealPlansTable createAlias(String alias) {
    return $MealPlansTable(attachedDatabase, alias);
  }
}

class MealPlan extends DataClass implements Insertable<MealPlan> {
  final String id;
  final int weekStartDate;
  final int createdAt;
  final int updatedAt;
  const MealPlan({
    required this.id,
    required this.weekStartDate,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['week_start_date'] = Variable<int>(weekStartDate);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  MealPlansCompanion toCompanion(bool nullToAbsent) {
    return MealPlansCompanion(
      id: Value(id),
      weekStartDate: Value(weekStartDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MealPlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealPlan(
      id: serializer.fromJson<String>(json['id']),
      weekStartDate: serializer.fromJson<int>(json['weekStartDate']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'weekStartDate': serializer.toJson<int>(weekStartDate),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  MealPlan copyWith({
    String? id,
    int? weekStartDate,
    int? createdAt,
    int? updatedAt,
  }) => MealPlan(
    id: id ?? this.id,
    weekStartDate: weekStartDate ?? this.weekStartDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MealPlan copyWithCompanion(MealPlansCompanion data) {
    return MealPlan(
      id: data.id.present ? data.id.value : this.id,
      weekStartDate: data.weekStartDate.present
          ? data.weekStartDate.value
          : this.weekStartDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealPlan(')
          ..write('id: $id, ')
          ..write('weekStartDate: $weekStartDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, weekStartDate, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealPlan &&
          other.id == this.id &&
          other.weekStartDate == this.weekStartDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MealPlansCompanion extends UpdateCompanion<MealPlan> {
  final Value<String> id;
  final Value<int> weekStartDate;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const MealPlansCompanion({
    this.id = const Value.absent(),
    this.weekStartDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealPlansCompanion.insert({
    required String id,
    required int weekStartDate,
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       weekStartDate = Value(weekStartDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MealPlan> custom({
    Expression<String>? id,
    Expression<int>? weekStartDate,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weekStartDate != null) 'week_start_date': weekStartDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealPlansCompanion copyWith({
    Value<String>? id,
    Value<int>? weekStartDate,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return MealPlansCompanion(
      id: id ?? this.id,
      weekStartDate: weekStartDate ?? this.weekStartDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (weekStartDate.present) {
      map['week_start_date'] = Variable<int>(weekStartDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealPlansCompanion(')
          ..write('id: $id, ')
          ..write('weekStartDate: $weekStartDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlannedMealsTable extends PlannedMeals
    with TableInfo<$PlannedMealsTable, PlannedMeal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlannedMealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealPlanIdMeta = const VerificationMeta(
    'mealPlanId',
  );
  @override
  late final GeneratedColumn<String> mealPlanId = GeneratedColumn<String>(
    'meal_plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meal_plans (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _plannedDateMeta = const VerificationMeta(
    'plannedDate',
  );
  @override
  late final GeneratedColumn<int> plannedDate = GeneratedColumn<int>(
    'planned_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('planned'),
  );
  static const VerificationMeta _cookedAtMeta = const VerificationMeta(
    'cookedAt',
  );
  @override
  late final GeneratedColumn<int> cookedAt = GeneratedColumn<int>(
    'cooked_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _servingsPlannedMeta = const VerificationMeta(
    'servingsPlanned',
  );
  @override
  late final GeneratedColumn<double> servingsPlanned = GeneratedColumn<double>(
    'servings_planned',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _servingsRemainingMeta = const VerificationMeta(
    'servingsRemaining',
  );
  @override
  late final GeneratedColumn<double> servingsRemaining =
      GeneratedColumn<double>(
        'servings_remaining',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mealPlanId,
    recipeId,
    plannedDate,
    status,
    cookedAt,
    servingsPlanned,
    servingsRemaining,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'planned_meals';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlannedMeal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('meal_plan_id')) {
      context.handle(
        _mealPlanIdMeta,
        mealPlanId.isAcceptableOrUnknown(
          data['meal_plan_id']!,
          _mealPlanIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mealPlanIdMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('planned_date')) {
      context.handle(
        _plannedDateMeta,
        plannedDate.isAcceptableOrUnknown(
          data['planned_date']!,
          _plannedDateMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('cooked_at')) {
      context.handle(
        _cookedAtMeta,
        cookedAt.isAcceptableOrUnknown(data['cooked_at']!, _cookedAtMeta),
      );
    }
    if (data.containsKey('servings_planned')) {
      context.handle(
        _servingsPlannedMeta,
        servingsPlanned.isAcceptableOrUnknown(
          data['servings_planned']!,
          _servingsPlannedMeta,
        ),
      );
    }
    if (data.containsKey('servings_remaining')) {
      context.handle(
        _servingsRemainingMeta,
        servingsRemaining.isAcceptableOrUnknown(
          data['servings_remaining']!,
          _servingsRemainingMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlannedMeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlannedMeal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mealPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_plan_id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      plannedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}planned_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      cookedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cooked_at'],
      ),
      servingsPlanned: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}servings_planned'],
      ),
      servingsRemaining: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}servings_remaining'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PlannedMealsTable createAlias(String alias) {
    return $PlannedMealsTable(attachedDatabase, alias);
  }
}

class PlannedMeal extends DataClass implements Insertable<PlannedMeal> {
  final String id;
  final String mealPlanId;
  final String recipeId;
  final int? plannedDate;
  final String status;
  final int? cookedAt;
  final double? servingsPlanned;
  final double? servingsRemaining;
  final String? notes;
  final int createdAt;
  final int updatedAt;
  const PlannedMeal({
    required this.id,
    required this.mealPlanId,
    required this.recipeId,
    this.plannedDate,
    required this.status,
    this.cookedAt,
    this.servingsPlanned,
    this.servingsRemaining,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['meal_plan_id'] = Variable<String>(mealPlanId);
    map['recipe_id'] = Variable<String>(recipeId);
    if (!nullToAbsent || plannedDate != null) {
      map['planned_date'] = Variable<int>(plannedDate);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || cookedAt != null) {
      map['cooked_at'] = Variable<int>(cookedAt);
    }
    if (!nullToAbsent || servingsPlanned != null) {
      map['servings_planned'] = Variable<double>(servingsPlanned);
    }
    if (!nullToAbsent || servingsRemaining != null) {
      map['servings_remaining'] = Variable<double>(servingsRemaining);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  PlannedMealsCompanion toCompanion(bool nullToAbsent) {
    return PlannedMealsCompanion(
      id: Value(id),
      mealPlanId: Value(mealPlanId),
      recipeId: Value(recipeId),
      plannedDate: plannedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedDate),
      status: Value(status),
      cookedAt: cookedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(cookedAt),
      servingsPlanned: servingsPlanned == null && nullToAbsent
          ? const Value.absent()
          : Value(servingsPlanned),
      servingsRemaining: servingsRemaining == null && nullToAbsent
          ? const Value.absent()
          : Value(servingsRemaining),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PlannedMeal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlannedMeal(
      id: serializer.fromJson<String>(json['id']),
      mealPlanId: serializer.fromJson<String>(json['mealPlanId']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      plannedDate: serializer.fromJson<int?>(json['plannedDate']),
      status: serializer.fromJson<String>(json['status']),
      cookedAt: serializer.fromJson<int?>(json['cookedAt']),
      servingsPlanned: serializer.fromJson<double?>(json['servingsPlanned']),
      servingsRemaining: serializer.fromJson<double?>(
        json['servingsRemaining'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mealPlanId': serializer.toJson<String>(mealPlanId),
      'recipeId': serializer.toJson<String>(recipeId),
      'plannedDate': serializer.toJson<int?>(plannedDate),
      'status': serializer.toJson<String>(status),
      'cookedAt': serializer.toJson<int?>(cookedAt),
      'servingsPlanned': serializer.toJson<double?>(servingsPlanned),
      'servingsRemaining': serializer.toJson<double?>(servingsRemaining),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  PlannedMeal copyWith({
    String? id,
    String? mealPlanId,
    String? recipeId,
    Value<int?> plannedDate = const Value.absent(),
    String? status,
    Value<int?> cookedAt = const Value.absent(),
    Value<double?> servingsPlanned = const Value.absent(),
    Value<double?> servingsRemaining = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => PlannedMeal(
    id: id ?? this.id,
    mealPlanId: mealPlanId ?? this.mealPlanId,
    recipeId: recipeId ?? this.recipeId,
    plannedDate: plannedDate.present ? plannedDate.value : this.plannedDate,
    status: status ?? this.status,
    cookedAt: cookedAt.present ? cookedAt.value : this.cookedAt,
    servingsPlanned: servingsPlanned.present
        ? servingsPlanned.value
        : this.servingsPlanned,
    servingsRemaining: servingsRemaining.present
        ? servingsRemaining.value
        : this.servingsRemaining,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PlannedMeal copyWithCompanion(PlannedMealsCompanion data) {
    return PlannedMeal(
      id: data.id.present ? data.id.value : this.id,
      mealPlanId: data.mealPlanId.present
          ? data.mealPlanId.value
          : this.mealPlanId,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      plannedDate: data.plannedDate.present
          ? data.plannedDate.value
          : this.plannedDate,
      status: data.status.present ? data.status.value : this.status,
      cookedAt: data.cookedAt.present ? data.cookedAt.value : this.cookedAt,
      servingsPlanned: data.servingsPlanned.present
          ? data.servingsPlanned.value
          : this.servingsPlanned,
      servingsRemaining: data.servingsRemaining.present
          ? data.servingsRemaining.value
          : this.servingsRemaining,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlannedMeal(')
          ..write('id: $id, ')
          ..write('mealPlanId: $mealPlanId, ')
          ..write('recipeId: $recipeId, ')
          ..write('plannedDate: $plannedDate, ')
          ..write('status: $status, ')
          ..write('cookedAt: $cookedAt, ')
          ..write('servingsPlanned: $servingsPlanned, ')
          ..write('servingsRemaining: $servingsRemaining, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    mealPlanId,
    recipeId,
    plannedDate,
    status,
    cookedAt,
    servingsPlanned,
    servingsRemaining,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlannedMeal &&
          other.id == this.id &&
          other.mealPlanId == this.mealPlanId &&
          other.recipeId == this.recipeId &&
          other.plannedDate == this.plannedDate &&
          other.status == this.status &&
          other.cookedAt == this.cookedAt &&
          other.servingsPlanned == this.servingsPlanned &&
          other.servingsRemaining == this.servingsRemaining &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PlannedMealsCompanion extends UpdateCompanion<PlannedMeal> {
  final Value<String> id;
  final Value<String> mealPlanId;
  final Value<String> recipeId;
  final Value<int?> plannedDate;
  final Value<String> status;
  final Value<int?> cookedAt;
  final Value<double?> servingsPlanned;
  final Value<double?> servingsRemaining;
  final Value<String?> notes;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const PlannedMealsCompanion({
    this.id = const Value.absent(),
    this.mealPlanId = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.plannedDate = const Value.absent(),
    this.status = const Value.absent(),
    this.cookedAt = const Value.absent(),
    this.servingsPlanned = const Value.absent(),
    this.servingsRemaining = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlannedMealsCompanion.insert({
    required String id,
    required String mealPlanId,
    required String recipeId,
    this.plannedDate = const Value.absent(),
    this.status = const Value.absent(),
    this.cookedAt = const Value.absent(),
    this.servingsPlanned = const Value.absent(),
    this.servingsRemaining = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mealPlanId = Value(mealPlanId),
       recipeId = Value(recipeId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PlannedMeal> custom({
    Expression<String>? id,
    Expression<String>? mealPlanId,
    Expression<String>? recipeId,
    Expression<int>? plannedDate,
    Expression<String>? status,
    Expression<int>? cookedAt,
    Expression<double>? servingsPlanned,
    Expression<double>? servingsRemaining,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mealPlanId != null) 'meal_plan_id': mealPlanId,
      if (recipeId != null) 'recipe_id': recipeId,
      if (plannedDate != null) 'planned_date': plannedDate,
      if (status != null) 'status': status,
      if (cookedAt != null) 'cooked_at': cookedAt,
      if (servingsPlanned != null) 'servings_planned': servingsPlanned,
      if (servingsRemaining != null) 'servings_remaining': servingsRemaining,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlannedMealsCompanion copyWith({
    Value<String>? id,
    Value<String>? mealPlanId,
    Value<String>? recipeId,
    Value<int?>? plannedDate,
    Value<String>? status,
    Value<int?>? cookedAt,
    Value<double?>? servingsPlanned,
    Value<double?>? servingsRemaining,
    Value<String?>? notes,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return PlannedMealsCompanion(
      id: id ?? this.id,
      mealPlanId: mealPlanId ?? this.mealPlanId,
      recipeId: recipeId ?? this.recipeId,
      plannedDate: plannedDate ?? this.plannedDate,
      status: status ?? this.status,
      cookedAt: cookedAt ?? this.cookedAt,
      servingsPlanned: servingsPlanned ?? this.servingsPlanned,
      servingsRemaining: servingsRemaining ?? this.servingsRemaining,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mealPlanId.present) {
      map['meal_plan_id'] = Variable<String>(mealPlanId.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (plannedDate.present) {
      map['planned_date'] = Variable<int>(plannedDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (cookedAt.present) {
      map['cooked_at'] = Variable<int>(cookedAt.value);
    }
    if (servingsPlanned.present) {
      map['servings_planned'] = Variable<double>(servingsPlanned.value);
    }
    if (servingsRemaining.present) {
      map['servings_remaining'] = Variable<double>(servingsRemaining.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlannedMealsCompanion(')
          ..write('id: $id, ')
          ..write('mealPlanId: $mealPlanId, ')
          ..write('recipeId: $recipeId, ')
          ..write('plannedDate: $plannedDate, ')
          ..write('status: $status, ')
          ..write('cookedAt: $cookedAt, ')
          ..write('servingsPlanned: $servingsPlanned, ')
          ..write('servingsRemaining: $servingsRemaining, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CookedMealsTable extends CookedMeals
    with TableInfo<$CookedMealsTable, CookedMeal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CookedMealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _plannedMealIdMeta = const VerificationMeta(
    'plannedMealId',
  );
  @override
  late final GeneratedColumn<String> plannedMealId = GeneratedColumn<String>(
    'planned_meal_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cookedAtMeta = const VerificationMeta(
    'cookedAt',
  );
  @override
  late final GeneratedColumn<int> cookedAt = GeneratedColumn<int>(
    'cooked_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _servingsCookedMeta = const VerificationMeta(
    'servingsCooked',
  );
  @override
  late final GeneratedColumn<double> servingsCooked = GeneratedColumn<double>(
    'servings_cooked',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _servingsRemainingMeta = const VerificationMeta(
    'servingsRemaining',
  );
  @override
  late final GeneratedColumn<double> servingsRemaining =
      GeneratedColumn<double>(
        'servings_remaining',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _estimatedGoodUntilMeta =
      const VerificationMeta('estimatedGoodUntil');
  @override
  late final GeneratedColumn<int> estimatedGoodUntil = GeneratedColumn<int>(
    'estimated_good_until',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    plannedMealId,
    cookedAt,
    servingsCooked,
    servingsRemaining,
    estimatedGoodUntil,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cooked_meals';
  @override
  VerificationContext validateIntegrity(
    Insertable<CookedMeal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('planned_meal_id')) {
      context.handle(
        _plannedMealIdMeta,
        plannedMealId.isAcceptableOrUnknown(
          data['planned_meal_id']!,
          _plannedMealIdMeta,
        ),
      );
    }
    if (data.containsKey('cooked_at')) {
      context.handle(
        _cookedAtMeta,
        cookedAt.isAcceptableOrUnknown(data['cooked_at']!, _cookedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cookedAtMeta);
    }
    if (data.containsKey('servings_cooked')) {
      context.handle(
        _servingsCookedMeta,
        servingsCooked.isAcceptableOrUnknown(
          data['servings_cooked']!,
          _servingsCookedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servingsCookedMeta);
    }
    if (data.containsKey('servings_remaining')) {
      context.handle(
        _servingsRemainingMeta,
        servingsRemaining.isAcceptableOrUnknown(
          data['servings_remaining']!,
          _servingsRemainingMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servingsRemainingMeta);
    }
    if (data.containsKey('estimated_good_until')) {
      context.handle(
        _estimatedGoodUntilMeta,
        estimatedGoodUntil.isAcceptableOrUnknown(
          data['estimated_good_until']!,
          _estimatedGoodUntilMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CookedMeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CookedMeal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      plannedMealId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}planned_meal_id'],
      ),
      cookedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cooked_at'],
      )!,
      servingsCooked: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}servings_cooked'],
      )!,
      servingsRemaining: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}servings_remaining'],
      )!,
      estimatedGoodUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_good_until'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CookedMealsTable createAlias(String alias) {
    return $CookedMealsTable(attachedDatabase, alias);
  }
}

class CookedMeal extends DataClass implements Insertable<CookedMeal> {
  final String id;
  final String recipeId;
  final String? plannedMealId;
  final int cookedAt;
  final double servingsCooked;
  final double servingsRemaining;
  final int? estimatedGoodUntil;
  final String? notes;
  final int createdAt;
  final int updatedAt;
  const CookedMeal({
    required this.id,
    required this.recipeId,
    this.plannedMealId,
    required this.cookedAt,
    required this.servingsCooked,
    required this.servingsRemaining,
    this.estimatedGoodUntil,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recipe_id'] = Variable<String>(recipeId);
    if (!nullToAbsent || plannedMealId != null) {
      map['planned_meal_id'] = Variable<String>(plannedMealId);
    }
    map['cooked_at'] = Variable<int>(cookedAt);
    map['servings_cooked'] = Variable<double>(servingsCooked);
    map['servings_remaining'] = Variable<double>(servingsRemaining);
    if (!nullToAbsent || estimatedGoodUntil != null) {
      map['estimated_good_until'] = Variable<int>(estimatedGoodUntil);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  CookedMealsCompanion toCompanion(bool nullToAbsent) {
    return CookedMealsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      plannedMealId: plannedMealId == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedMealId),
      cookedAt: Value(cookedAt),
      servingsCooked: Value(servingsCooked),
      servingsRemaining: Value(servingsRemaining),
      estimatedGoodUntil: estimatedGoodUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedGoodUntil),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CookedMeal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CookedMeal(
      id: serializer.fromJson<String>(json['id']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      plannedMealId: serializer.fromJson<String?>(json['plannedMealId']),
      cookedAt: serializer.fromJson<int>(json['cookedAt']),
      servingsCooked: serializer.fromJson<double>(json['servingsCooked']),
      servingsRemaining: serializer.fromJson<double>(json['servingsRemaining']),
      estimatedGoodUntil: serializer.fromJson<int?>(json['estimatedGoodUntil']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recipeId': serializer.toJson<String>(recipeId),
      'plannedMealId': serializer.toJson<String?>(plannedMealId),
      'cookedAt': serializer.toJson<int>(cookedAt),
      'servingsCooked': serializer.toJson<double>(servingsCooked),
      'servingsRemaining': serializer.toJson<double>(servingsRemaining),
      'estimatedGoodUntil': serializer.toJson<int?>(estimatedGoodUntil),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  CookedMeal copyWith({
    String? id,
    String? recipeId,
    Value<String?> plannedMealId = const Value.absent(),
    int? cookedAt,
    double? servingsCooked,
    double? servingsRemaining,
    Value<int?> estimatedGoodUntil = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => CookedMeal(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    plannedMealId: plannedMealId.present
        ? plannedMealId.value
        : this.plannedMealId,
    cookedAt: cookedAt ?? this.cookedAt,
    servingsCooked: servingsCooked ?? this.servingsCooked,
    servingsRemaining: servingsRemaining ?? this.servingsRemaining,
    estimatedGoodUntil: estimatedGoodUntil.present
        ? estimatedGoodUntil.value
        : this.estimatedGoodUntil,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CookedMeal copyWithCompanion(CookedMealsCompanion data) {
    return CookedMeal(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      plannedMealId: data.plannedMealId.present
          ? data.plannedMealId.value
          : this.plannedMealId,
      cookedAt: data.cookedAt.present ? data.cookedAt.value : this.cookedAt,
      servingsCooked: data.servingsCooked.present
          ? data.servingsCooked.value
          : this.servingsCooked,
      servingsRemaining: data.servingsRemaining.present
          ? data.servingsRemaining.value
          : this.servingsRemaining,
      estimatedGoodUntil: data.estimatedGoodUntil.present
          ? data.estimatedGoodUntil.value
          : this.estimatedGoodUntil,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CookedMeal(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('plannedMealId: $plannedMealId, ')
          ..write('cookedAt: $cookedAt, ')
          ..write('servingsCooked: $servingsCooked, ')
          ..write('servingsRemaining: $servingsRemaining, ')
          ..write('estimatedGoodUntil: $estimatedGoodUntil, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recipeId,
    plannedMealId,
    cookedAt,
    servingsCooked,
    servingsRemaining,
    estimatedGoodUntil,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CookedMeal &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.plannedMealId == this.plannedMealId &&
          other.cookedAt == this.cookedAt &&
          other.servingsCooked == this.servingsCooked &&
          other.servingsRemaining == this.servingsRemaining &&
          other.estimatedGoodUntil == this.estimatedGoodUntil &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CookedMealsCompanion extends UpdateCompanion<CookedMeal> {
  final Value<String> id;
  final Value<String> recipeId;
  final Value<String?> plannedMealId;
  final Value<int> cookedAt;
  final Value<double> servingsCooked;
  final Value<double> servingsRemaining;
  final Value<int?> estimatedGoodUntil;
  final Value<String?> notes;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const CookedMealsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.plannedMealId = const Value.absent(),
    this.cookedAt = const Value.absent(),
    this.servingsCooked = const Value.absent(),
    this.servingsRemaining = const Value.absent(),
    this.estimatedGoodUntil = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CookedMealsCompanion.insert({
    required String id,
    required String recipeId,
    this.plannedMealId = const Value.absent(),
    required int cookedAt,
    required double servingsCooked,
    required double servingsRemaining,
    this.estimatedGoodUntil = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       recipeId = Value(recipeId),
       cookedAt = Value(cookedAt),
       servingsCooked = Value(servingsCooked),
       servingsRemaining = Value(servingsRemaining),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CookedMeal> custom({
    Expression<String>? id,
    Expression<String>? recipeId,
    Expression<String>? plannedMealId,
    Expression<int>? cookedAt,
    Expression<double>? servingsCooked,
    Expression<double>? servingsRemaining,
    Expression<int>? estimatedGoodUntil,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (plannedMealId != null) 'planned_meal_id': plannedMealId,
      if (cookedAt != null) 'cooked_at': cookedAt,
      if (servingsCooked != null) 'servings_cooked': servingsCooked,
      if (servingsRemaining != null) 'servings_remaining': servingsRemaining,
      if (estimatedGoodUntil != null)
        'estimated_good_until': estimatedGoodUntil,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CookedMealsCompanion copyWith({
    Value<String>? id,
    Value<String>? recipeId,
    Value<String?>? plannedMealId,
    Value<int>? cookedAt,
    Value<double>? servingsCooked,
    Value<double>? servingsRemaining,
    Value<int?>? estimatedGoodUntil,
    Value<String?>? notes,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return CookedMealsCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      plannedMealId: plannedMealId ?? this.plannedMealId,
      cookedAt: cookedAt ?? this.cookedAt,
      servingsCooked: servingsCooked ?? this.servingsCooked,
      servingsRemaining: servingsRemaining ?? this.servingsRemaining,
      estimatedGoodUntil: estimatedGoodUntil ?? this.estimatedGoodUntil,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (plannedMealId.present) {
      map['planned_meal_id'] = Variable<String>(plannedMealId.value);
    }
    if (cookedAt.present) {
      map['cooked_at'] = Variable<int>(cookedAt.value);
    }
    if (servingsCooked.present) {
      map['servings_cooked'] = Variable<double>(servingsCooked.value);
    }
    if (servingsRemaining.present) {
      map['servings_remaining'] = Variable<double>(servingsRemaining.value);
    }
    if (estimatedGoodUntil.present) {
      map['estimated_good_until'] = Variable<int>(estimatedGoodUntil.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CookedMealsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('plannedMealId: $plannedMealId, ')
          ..write('cookedAt: $cookedAt, ')
          ..write('servingsCooked: $servingsCooked, ')
          ..write('servingsRemaining: $servingsRemaining, ')
          ..write('estimatedGoodUntil: $estimatedGoodUntil, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StorageSpacesTable extends StorageSpaces
    with TableInfo<$StorageSpacesTable, StorageSpace> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageSpacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isSystemMeta = const VerificationMeta(
    'isSystem',
  );
  @override
  late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>(
    'is_system',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_system" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdByUserMeta = const VerificationMeta(
    'createdByUser',
  );
  @override
  late final GeneratedColumn<String> createdByUser = GeneratedColumn<String>(
    'created_by_user',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    sortOrder,
    isSystem,
    createdByUser,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_spaces';
  @override
  VerificationContext validateIntegrity(
    Insertable<StorageSpace> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_system')) {
      context.handle(
        _isSystemMeta,
        isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta),
      );
    }
    if (data.containsKey('created_by_user')) {
      context.handle(
        _createdByUserMeta,
        createdByUser.isAcceptableOrUnknown(
          data['created_by_user']!,
          _createdByUserMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StorageSpace map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageSpace(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      isSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_system'],
      )!,
      createdByUser: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_user'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $StorageSpacesTable createAlias(String alias) {
    return $StorageSpacesTable(attachedDatabase, alias);
  }
}

class StorageSpace extends DataClass implements Insertable<StorageSpace> {
  final String id;
  final String name;
  final int sortOrder;
  final bool isSystem;
  final String? createdByUser;
  final int createdAt;
  final int updatedAt;
  const StorageSpace({
    required this.id,
    required this.name,
    required this.sortOrder,
    required this.isSystem,
    this.createdByUser,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_system'] = Variable<bool>(isSystem);
    if (!nullToAbsent || createdByUser != null) {
      map['created_by_user'] = Variable<String>(createdByUser);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  StorageSpacesCompanion toCompanion(bool nullToAbsent) {
    return StorageSpacesCompanion(
      id: Value(id),
      name: Value(name),
      sortOrder: Value(sortOrder),
      isSystem: Value(isSystem),
      createdByUser: createdByUser == null && nullToAbsent
          ? const Value.absent()
          : Value(createdByUser),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory StorageSpace.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageSpace(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isSystem: serializer.fromJson<bool>(json['isSystem']),
      createdByUser: serializer.fromJson<String?>(json['createdByUser']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isSystem': serializer.toJson<bool>(isSystem),
      'createdByUser': serializer.toJson<String?>(createdByUser),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  StorageSpace copyWith({
    String? id,
    String? name,
    int? sortOrder,
    bool? isSystem,
    Value<String?> createdByUser = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => StorageSpace(
    id: id ?? this.id,
    name: name ?? this.name,
    sortOrder: sortOrder ?? this.sortOrder,
    isSystem: isSystem ?? this.isSystem,
    createdByUser: createdByUser.present
        ? createdByUser.value
        : this.createdByUser,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  StorageSpace copyWithCompanion(StorageSpacesCompanion data) {
    return StorageSpace(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isSystem: data.isSystem.present ? data.isSystem.value : this.isSystem,
      createdByUser: data.createdByUser.present
          ? data.createdByUser.value
          : this.createdByUser,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageSpace(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isSystem: $isSystem, ')
          ..write('createdByUser: $createdByUser, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    sortOrder,
    isSystem,
    createdByUser,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageSpace &&
          other.id == this.id &&
          other.name == this.name &&
          other.sortOrder == this.sortOrder &&
          other.isSystem == this.isSystem &&
          other.createdByUser == this.createdByUser &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StorageSpacesCompanion extends UpdateCompanion<StorageSpace> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> sortOrder;
  final Value<bool> isSystem;
  final Value<String?> createdByUser;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const StorageSpacesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.createdByUser = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StorageSpacesCompanion.insert({
    required String id,
    required String name,
    this.sortOrder = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.createdByUser = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<StorageSpace> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? sortOrder,
    Expression<bool>? isSystem,
    Expression<String>? createdByUser,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isSystem != null) 'is_system': isSystem,
      if (createdByUser != null) 'created_by_user': createdByUser,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StorageSpacesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? sortOrder,
    Value<bool>? isSystem,
    Value<String?>? createdByUser,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return StorageSpacesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sortOrder: sortOrder ?? this.sortOrder,
      isSystem: isSystem ?? this.isSystem,
      createdByUser: createdByUser ?? this.createdByUser,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isSystem.present) {
      map['is_system'] = Variable<bool>(isSystem.value);
    }
    if (createdByUser.present) {
      map['created_by_user'] = Variable<String>(createdByUser.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageSpacesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isSystem: $isSystem, ')
          ..write('createdByUser: $createdByUser, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HomeInventoryItemsTable extends HomeInventoryItems
    with TableInfo<$HomeInventoryItemsTable, HomeInventoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HomeInventoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemCatalogIdMeta = const VerificationMeta(
    'itemCatalogId',
  );
  @override
  late final GeneratedColumn<String> itemCatalogId = GeneratedColumn<String>(
    'item_catalog_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _itemKeyMeta = const VerificationMeta(
    'itemKey',
  );
  @override
  late final GeneratedColumn<String> itemKey = GeneratedColumn<String>(
    'item_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _storageSpaceIdMeta = const VerificationMeta(
    'storageSpaceId',
  );
  @override
  late final GeneratedColumn<String> storageSpaceId = GeneratedColumn<String>(
    'storage_space_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES storage_spaces (id)',
    ),
  );
  static const VerificationMeta _acquiredAtMeta = const VerificationMeta(
    'acquiredAt',
  );
  @override
  late final GeneratedColumn<int> acquiredAt = GeneratedColumn<int>(
    'acquired_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _openedAtMeta = const VerificationMeta(
    'openedAt',
  );
  @override
  late final GeneratedColumn<int> openedAt = GeneratedColumn<int>(
    'opened_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<int> expiresAt = GeneratedColumn<int>(
    'expires_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isConsumedMeta = const VerificationMeta(
    'isConsumed',
  );
  @override
  late final GeneratedColumn<bool> isConsumed = GeneratedColumn<bool>(
    'is_consumed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_consumed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    itemCatalogId,
    itemKey,
    displayName,
    quantity,
    unit,
    storageSpaceId,
    acquiredAt,
    openedAt,
    expiresAt,
    notes,
    sourceType,
    isConsumed,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'home_inventory_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<HomeInventoryItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_catalog_id')) {
      context.handle(
        _itemCatalogIdMeta,
        itemCatalogId.isAcceptableOrUnknown(
          data['item_catalog_id']!,
          _itemCatalogIdMeta,
        ),
      );
    }
    if (data.containsKey('item_key')) {
      context.handle(
        _itemKeyMeta,
        itemKey.isAcceptableOrUnknown(data['item_key']!, _itemKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_itemKeyMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('storage_space_id')) {
      context.handle(
        _storageSpaceIdMeta,
        storageSpaceId.isAcceptableOrUnknown(
          data['storage_space_id']!,
          _storageSpaceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_storageSpaceIdMeta);
    }
    if (data.containsKey('acquired_at')) {
      context.handle(
        _acquiredAtMeta,
        acquiredAt.isAcceptableOrUnknown(data['acquired_at']!, _acquiredAtMeta),
      );
    }
    if (data.containsKey('opened_at')) {
      context.handle(
        _openedAtMeta,
        openedAt.isAcceptableOrUnknown(data['opened_at']!, _openedAtMeta),
      );
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    }
    if (data.containsKey('is_consumed')) {
      context.handle(
        _isConsumedMeta,
        isConsumed.isAcceptableOrUnknown(data['is_consumed']!, _isConsumedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HomeInventoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HomeInventoryItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      itemCatalogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_catalog_id'],
      ),
      itemKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_key'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      storageSpaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}storage_space_id'],
      )!,
      acquiredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}acquired_at'],
      ),
      openedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}opened_at'],
      ),
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}expires_at'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      ),
      isConsumed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_consumed'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $HomeInventoryItemsTable createAlias(String alias) {
    return $HomeInventoryItemsTable(attachedDatabase, alias);
  }
}

class HomeInventoryItem extends DataClass
    implements Insertable<HomeInventoryItem> {
  final String id;
  final String? itemCatalogId;
  final String itemKey;
  final String displayName;
  final double quantity;
  final String? unit;
  final String storageSpaceId;
  final int? acquiredAt;
  final int? openedAt;
  final int? expiresAt;
  final String? notes;
  final String? sourceType;
  final bool isConsumed;
  final int createdAt;
  final int updatedAt;
  const HomeInventoryItem({
    required this.id,
    this.itemCatalogId,
    required this.itemKey,
    required this.displayName,
    required this.quantity,
    this.unit,
    required this.storageSpaceId,
    this.acquiredAt,
    this.openedAt,
    this.expiresAt,
    this.notes,
    this.sourceType,
    required this.isConsumed,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || itemCatalogId != null) {
      map['item_catalog_id'] = Variable<String>(itemCatalogId);
    }
    map['item_key'] = Variable<String>(itemKey);
    map['display_name'] = Variable<String>(displayName);
    map['quantity'] = Variable<double>(quantity);
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    map['storage_space_id'] = Variable<String>(storageSpaceId);
    if (!nullToAbsent || acquiredAt != null) {
      map['acquired_at'] = Variable<int>(acquiredAt);
    }
    if (!nullToAbsent || openedAt != null) {
      map['opened_at'] = Variable<int>(openedAt);
    }
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<int>(expiresAt);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || sourceType != null) {
      map['source_type'] = Variable<String>(sourceType);
    }
    map['is_consumed'] = Variable<bool>(isConsumed);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  HomeInventoryItemsCompanion toCompanion(bool nullToAbsent) {
    return HomeInventoryItemsCompanion(
      id: Value(id),
      itemCatalogId: itemCatalogId == null && nullToAbsent
          ? const Value.absent()
          : Value(itemCatalogId),
      itemKey: Value(itemKey),
      displayName: Value(displayName),
      quantity: Value(quantity),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      storageSpaceId: Value(storageSpaceId),
      acquiredAt: acquiredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(acquiredAt),
      openedAt: openedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(openedAt),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      sourceType: sourceType == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceType),
      isConsumed: Value(isConsumed),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory HomeInventoryItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HomeInventoryItem(
      id: serializer.fromJson<String>(json['id']),
      itemCatalogId: serializer.fromJson<String?>(json['itemCatalogId']),
      itemKey: serializer.fromJson<String>(json['itemKey']),
      displayName: serializer.fromJson<String>(json['displayName']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unit: serializer.fromJson<String?>(json['unit']),
      storageSpaceId: serializer.fromJson<String>(json['storageSpaceId']),
      acquiredAt: serializer.fromJson<int?>(json['acquiredAt']),
      openedAt: serializer.fromJson<int?>(json['openedAt']),
      expiresAt: serializer.fromJson<int?>(json['expiresAt']),
      notes: serializer.fromJson<String?>(json['notes']),
      sourceType: serializer.fromJson<String?>(json['sourceType']),
      isConsumed: serializer.fromJson<bool>(json['isConsumed']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemCatalogId': serializer.toJson<String?>(itemCatalogId),
      'itemKey': serializer.toJson<String>(itemKey),
      'displayName': serializer.toJson<String>(displayName),
      'quantity': serializer.toJson<double>(quantity),
      'unit': serializer.toJson<String?>(unit),
      'storageSpaceId': serializer.toJson<String>(storageSpaceId),
      'acquiredAt': serializer.toJson<int?>(acquiredAt),
      'openedAt': serializer.toJson<int?>(openedAt),
      'expiresAt': serializer.toJson<int?>(expiresAt),
      'notes': serializer.toJson<String?>(notes),
      'sourceType': serializer.toJson<String?>(sourceType),
      'isConsumed': serializer.toJson<bool>(isConsumed),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  HomeInventoryItem copyWith({
    String? id,
    Value<String?> itemCatalogId = const Value.absent(),
    String? itemKey,
    String? displayName,
    double? quantity,
    Value<String?> unit = const Value.absent(),
    String? storageSpaceId,
    Value<int?> acquiredAt = const Value.absent(),
    Value<int?> openedAt = const Value.absent(),
    Value<int?> expiresAt = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> sourceType = const Value.absent(),
    bool? isConsumed,
    int? createdAt,
    int? updatedAt,
  }) => HomeInventoryItem(
    id: id ?? this.id,
    itemCatalogId: itemCatalogId.present
        ? itemCatalogId.value
        : this.itemCatalogId,
    itemKey: itemKey ?? this.itemKey,
    displayName: displayName ?? this.displayName,
    quantity: quantity ?? this.quantity,
    unit: unit.present ? unit.value : this.unit,
    storageSpaceId: storageSpaceId ?? this.storageSpaceId,
    acquiredAt: acquiredAt.present ? acquiredAt.value : this.acquiredAt,
    openedAt: openedAt.present ? openedAt.value : this.openedAt,
    expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
    notes: notes.present ? notes.value : this.notes,
    sourceType: sourceType.present ? sourceType.value : this.sourceType,
    isConsumed: isConsumed ?? this.isConsumed,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  HomeInventoryItem copyWithCompanion(HomeInventoryItemsCompanion data) {
    return HomeInventoryItem(
      id: data.id.present ? data.id.value : this.id,
      itemCatalogId: data.itemCatalogId.present
          ? data.itemCatalogId.value
          : this.itemCatalogId,
      itemKey: data.itemKey.present ? data.itemKey.value : this.itemKey,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unit: data.unit.present ? data.unit.value : this.unit,
      storageSpaceId: data.storageSpaceId.present
          ? data.storageSpaceId.value
          : this.storageSpaceId,
      acquiredAt: data.acquiredAt.present
          ? data.acquiredAt.value
          : this.acquiredAt,
      openedAt: data.openedAt.present ? data.openedAt.value : this.openedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      isConsumed: data.isConsumed.present
          ? data.isConsumed.value
          : this.isConsumed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HomeInventoryItem(')
          ..write('id: $id, ')
          ..write('itemCatalogId: $itemCatalogId, ')
          ..write('itemKey: $itemKey, ')
          ..write('displayName: $displayName, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('storageSpaceId: $storageSpaceId, ')
          ..write('acquiredAt: $acquiredAt, ')
          ..write('openedAt: $openedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('notes: $notes, ')
          ..write('sourceType: $sourceType, ')
          ..write('isConsumed: $isConsumed, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    itemCatalogId,
    itemKey,
    displayName,
    quantity,
    unit,
    storageSpaceId,
    acquiredAt,
    openedAt,
    expiresAt,
    notes,
    sourceType,
    isConsumed,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeInventoryItem &&
          other.id == this.id &&
          other.itemCatalogId == this.itemCatalogId &&
          other.itemKey == this.itemKey &&
          other.displayName == this.displayName &&
          other.quantity == this.quantity &&
          other.unit == this.unit &&
          other.storageSpaceId == this.storageSpaceId &&
          other.acquiredAt == this.acquiredAt &&
          other.openedAt == this.openedAt &&
          other.expiresAt == this.expiresAt &&
          other.notes == this.notes &&
          other.sourceType == this.sourceType &&
          other.isConsumed == this.isConsumed &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class HomeInventoryItemsCompanion extends UpdateCompanion<HomeInventoryItem> {
  final Value<String> id;
  final Value<String?> itemCatalogId;
  final Value<String> itemKey;
  final Value<String> displayName;
  final Value<double> quantity;
  final Value<String?> unit;
  final Value<String> storageSpaceId;
  final Value<int?> acquiredAt;
  final Value<int?> openedAt;
  final Value<int?> expiresAt;
  final Value<String?> notes;
  final Value<String?> sourceType;
  final Value<bool> isConsumed;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const HomeInventoryItemsCompanion({
    this.id = const Value.absent(),
    this.itemCatalogId = const Value.absent(),
    this.itemKey = const Value.absent(),
    this.displayName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.storageSpaceId = const Value.absent(),
    this.acquiredAt = const Value.absent(),
    this.openedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.isConsumed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HomeInventoryItemsCompanion.insert({
    required String id,
    this.itemCatalogId = const Value.absent(),
    required String itemKey,
    required String displayName,
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    required String storageSpaceId,
    this.acquiredAt = const Value.absent(),
    this.openedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.isConsumed = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       itemKey = Value(itemKey),
       displayName = Value(displayName),
       storageSpaceId = Value(storageSpaceId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<HomeInventoryItem> custom({
    Expression<String>? id,
    Expression<String>? itemCatalogId,
    Expression<String>? itemKey,
    Expression<String>? displayName,
    Expression<double>? quantity,
    Expression<String>? unit,
    Expression<String>? storageSpaceId,
    Expression<int>? acquiredAt,
    Expression<int>? openedAt,
    Expression<int>? expiresAt,
    Expression<String>? notes,
    Expression<String>? sourceType,
    Expression<bool>? isConsumed,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemCatalogId != null) 'item_catalog_id': itemCatalogId,
      if (itemKey != null) 'item_key': itemKey,
      if (displayName != null) 'display_name': displayName,
      if (quantity != null) 'quantity': quantity,
      if (unit != null) 'unit': unit,
      if (storageSpaceId != null) 'storage_space_id': storageSpaceId,
      if (acquiredAt != null) 'acquired_at': acquiredAt,
      if (openedAt != null) 'opened_at': openedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (notes != null) 'notes': notes,
      if (sourceType != null) 'source_type': sourceType,
      if (isConsumed != null) 'is_consumed': isConsumed,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HomeInventoryItemsCompanion copyWith({
    Value<String>? id,
    Value<String?>? itemCatalogId,
    Value<String>? itemKey,
    Value<String>? displayName,
    Value<double>? quantity,
    Value<String?>? unit,
    Value<String>? storageSpaceId,
    Value<int?>? acquiredAt,
    Value<int?>? openedAt,
    Value<int?>? expiresAt,
    Value<String?>? notes,
    Value<String?>? sourceType,
    Value<bool>? isConsumed,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return HomeInventoryItemsCompanion(
      id: id ?? this.id,
      itemCatalogId: itemCatalogId ?? this.itemCatalogId,
      itemKey: itemKey ?? this.itemKey,
      displayName: displayName ?? this.displayName,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      storageSpaceId: storageSpaceId ?? this.storageSpaceId,
      acquiredAt: acquiredAt ?? this.acquiredAt,
      openedAt: openedAt ?? this.openedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      notes: notes ?? this.notes,
      sourceType: sourceType ?? this.sourceType,
      isConsumed: isConsumed ?? this.isConsumed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemCatalogId.present) {
      map['item_catalog_id'] = Variable<String>(itemCatalogId.value);
    }
    if (itemKey.present) {
      map['item_key'] = Variable<String>(itemKey.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (storageSpaceId.present) {
      map['storage_space_id'] = Variable<String>(storageSpaceId.value);
    }
    if (acquiredAt.present) {
      map['acquired_at'] = Variable<int>(acquiredAt.value);
    }
    if (openedAt.present) {
      map['opened_at'] = Variable<int>(openedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<int>(expiresAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (isConsumed.present) {
      map['is_consumed'] = Variable<bool>(isConsumed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HomeInventoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('itemCatalogId: $itemCatalogId, ')
          ..write('itemKey: $itemKey, ')
          ..write('displayName: $displayName, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('storageSpaceId: $storageSpaceId, ')
          ..write('acquiredAt: $acquiredAt, ')
          ..write('openedAt: $openedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('notes: $notes, ')
          ..write('sourceType: $sourceType, ')
          ..write('isConsumed: $isConsumed, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueTypeMeta = const VerificationMeta(
    'valueType',
  );
  @override
  late final GeneratedColumn<String> valueType = GeneratedColumn<String>(
    'value_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, key, value, valueType, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    if (data.containsKey('value_type')) {
      context.handle(
        _valueTypeMeta,
        valueType.isAcceptableOrUnknown(data['value_type']!, _valueTypeMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      ),
      valueType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_type'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String id;
  final String key;
  final String? value;
  final String? valueType;
  final int updatedAt;
  const AppSetting({
    required this.id,
    required this.key,
    this.value,
    this.valueType,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || valueType != null) {
      map['value_type'] = Variable<String>(valueType);
    }
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      key: Value(key),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
      valueType: valueType == null && nullToAbsent
          ? const Value.absent()
          : Value(valueType),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<String>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String?>(json['value']),
      valueType: serializer.fromJson<String?>(json['valueType']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String?>(value),
      'valueType': serializer.toJson<String?>(valueType),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  AppSetting copyWith({
    String? id,
    String? key,
    Value<String?> value = const Value.absent(),
    Value<String?> valueType = const Value.absent(),
    int? updatedAt,
  }) => AppSetting(
    id: id ?? this.id,
    key: key ?? this.key,
    value: value.present ? value.value : this.value,
    valueType: valueType.present ? valueType.value : this.valueType,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      valueType: data.valueType.present ? data.valueType.value : this.valueType,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('valueType: $valueType, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, key, value, valueType, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.key == this.key &&
          other.value == this.value &&
          other.valueType == this.valueType &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> id;
  final Value<String> key;
  final Value<String?> value;
  final Value<String?> valueType;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.valueType = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String id,
    required String key,
    this.value = const Value.absent(),
    this.valueType = const Value.absent(),
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       key = Value(key),
       updatedAt = Value(updatedAt);
  static Insertable<AppSetting> custom({
    Expression<String>? id,
    Expression<String>? key,
    Expression<String>? value,
    Expression<String>? valueType,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (valueType != null) 'value_type': valueType,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? id,
    Value<String>? key,
    Value<String?>? value,
    Value<String?>? valueType,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      value: value ?? this.value,
      valueType: valueType ?? this.valueType,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (valueType.present) {
      map['value_type'] = Variable<String>(valueType.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('valueType: $valueType, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $IngredientCatalogTable ingredientCatalog =
      $IngredientCatalogTable(this);
  late final $RecipeIngredientsTable recipeIngredients =
      $RecipeIngredientsTable(this);
  late final $IngredientSubstitutesTable ingredientSubstitutes =
      $IngredientSubstitutesTable(this);
  late final $RecipeStepsTable recipeSteps = $RecipeStepsTable(this);
  late final $MealPlansTable mealPlans = $MealPlansTable(this);
  late final $PlannedMealsTable plannedMeals = $PlannedMealsTable(this);
  late final $CookedMealsTable cookedMeals = $CookedMealsTable(this);
  late final $StorageSpacesTable storageSpaces = $StorageSpacesTable(this);
  late final $HomeInventoryItemsTable homeInventoryItems =
      $HomeInventoryItemsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    recipes,
    ingredientCatalog,
    recipeIngredients,
    ingredientSubstitutes,
    recipeSteps,
    mealPlans,
    plannedMeals,
    cookedMeals,
    storageSpaces,
    homeInventoryItems,
    appSettings,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'meal_plans',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('planned_meals', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$RecipesTableCreateCompanionBuilder =
    RecipesCompanion Function({
      required String id,
      required String title,
      Value<double?> servings,
      required String instructions,
      Value<String?> tags,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$RecipesTableUpdateCompanionBuilder =
    RecipesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<double?> servings,
      Value<String> instructions,
      Value<String?> tags,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$RecipesTableReferences
    extends BaseReferences<_$AppDatabase, $RecipesTable, Recipe> {
  $$RecipesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeIngredientsTable, List<RecipeIngredient>>
  _recipeIngredientsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeIngredients,
        aliasName: $_aliasNameGenerator(
          db.recipes.id,
          db.recipeIngredients.recipeId,
        ),
      );

  $$RecipeIngredientsTableProcessedTableManager get recipeIngredientsRefs {
    final manager = $$RecipeIngredientsTableTableManager(
      $_db,
      $_db.recipeIngredients,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $IngredientSubstitutesTable,
    List<IngredientSubstitute>
  >
  _ingredientSubstitutesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.ingredientSubstitutes,
        aliasName: $_aliasNameGenerator(
          db.recipes.id,
          db.ingredientSubstitutes.recipeId,
        ),
      );

  $$IngredientSubstitutesTableProcessedTableManager
  get ingredientSubstitutesRefs {
    final manager = $$IngredientSubstitutesTableTableManager(
      $_db,
      $_db.ingredientSubstitutes,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _ingredientSubstitutesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RecipeStepsTable, List<RecipeStep>>
  _recipeStepsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recipeSteps,
    aliasName: $_aliasNameGenerator(db.recipes.id, db.recipeSteps.recipeId),
  );

  $$RecipeStepsTableProcessedTableManager get recipeStepsRefs {
    final manager = $$RecipeStepsTableTableManager(
      $_db,
      $_db.recipeSteps,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_recipeStepsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PlannedMealsTable, List<PlannedMeal>>
  _plannedMealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.plannedMeals,
    aliasName: $_aliasNameGenerator(db.recipes.id, db.plannedMeals.recipeId),
  );

  $$PlannedMealsTableProcessedTableManager get plannedMealsRefs {
    final manager = $$PlannedMealsTableTableManager(
      $_db,
      $_db.plannedMeals,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_plannedMealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CookedMealsTable, List<CookedMeal>>
  _cookedMealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cookedMeals,
    aliasName: $_aliasNameGenerator(db.recipes.id, db.cookedMeals.recipeId),
  );

  $$CookedMealsTableProcessedTableManager get cookedMealsRefs {
    final manager = $$CookedMealsTableTableManager(
      $_db,
      $_db.cookedMeals,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_cookedMealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeIngredientsRefs(
    Expression<bool> Function($$RecipeIngredientsTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredients,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientsTableFilterComposer(
            $db: $db,
            $table: $db.recipeIngredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ingredientSubstitutesRefs(
    Expression<bool> Function($$IngredientSubstitutesTableFilterComposer f) f,
  ) {
    final $$IngredientSubstitutesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.ingredientSubstitutes,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IngredientSubstitutesTableFilterComposer(
                $db: $db,
                $table: $db.ingredientSubstitutes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> recipeStepsRefs(
    Expression<bool> Function($$RecipeStepsTableFilterComposer f) f,
  ) {
    final $$RecipeStepsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeSteps,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepsTableFilterComposer(
            $db: $db,
            $table: $db.recipeSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> plannedMealsRefs(
    Expression<bool> Function($$PlannedMealsTableFilterComposer f) f,
  ) {
    final $$PlannedMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.plannedMeals,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlannedMealsTableFilterComposer(
            $db: $db,
            $table: $db.plannedMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cookedMealsRefs(
    Expression<bool> Function($$CookedMealsTableFilterComposer f) f,
  ) {
    final $$CookedMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cookedMeals,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookedMealsTableFilterComposer(
            $db: $db,
            $table: $db.cookedMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> recipeIngredientsRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientsTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredients,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeIngredients,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> ingredientSubstitutesRefs<T extends Object>(
    Expression<T> Function($$IngredientSubstitutesTableAnnotationComposer a) f,
  ) {
    final $$IngredientSubstitutesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.ingredientSubstitutes,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IngredientSubstitutesTableAnnotationComposer(
                $db: $db,
                $table: $db.ingredientSubstitutes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> recipeStepsRefs<T extends Object>(
    Expression<T> Function($$RecipeStepsTableAnnotationComposer a) f,
  ) {
    final $$RecipeStepsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeSteps,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepsTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> plannedMealsRefs<T extends Object>(
    Expression<T> Function($$PlannedMealsTableAnnotationComposer a) f,
  ) {
    final $$PlannedMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.plannedMeals,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlannedMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.plannedMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> cookedMealsRefs<T extends Object>(
    Expression<T> Function($$CookedMealsTableAnnotationComposer a) f,
  ) {
    final $$CookedMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cookedMeals,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookedMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.cookedMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipesTable,
          Recipe,
          $$RecipesTableFilterComposer,
          $$RecipesTableOrderingComposer,
          $$RecipesTableAnnotationComposer,
          $$RecipesTableCreateCompanionBuilder,
          $$RecipesTableUpdateCompanionBuilder,
          (Recipe, $$RecipesTableReferences),
          Recipe,
          PrefetchHooks Function({
            bool recipeIngredientsRefs,
            bool ingredientSubstitutesRefs,
            bool recipeStepsRefs,
            bool plannedMealsRefs,
            bool cookedMealsRefs,
          })
        > {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<double?> servings = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipesCompanion(
                id: id,
                title: title,
                servings: servings,
                instructions: instructions,
                tags: tags,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<double?> servings = const Value.absent(),
                required String instructions,
                Value<String?> tags = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => RecipesCompanion.insert(
                id: id,
                title: title,
                servings: servings,
                instructions: instructions,
                tags: tags,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                recipeIngredientsRefs = false,
                ingredientSubstitutesRefs = false,
                recipeStepsRefs = false,
                plannedMealsRefs = false,
                cookedMealsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeIngredientsRefs) db.recipeIngredients,
                    if (ingredientSubstitutesRefs) db.ingredientSubstitutes,
                    if (recipeStepsRefs) db.recipeSteps,
                    if (plannedMealsRefs) db.plannedMeals,
                    if (cookedMealsRefs) db.cookedMeals,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recipeIngredientsRefs)
                        await $_getPrefetchedData<
                          Recipe,
                          $RecipesTable,
                          RecipeIngredient
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._recipeIngredientsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeIngredientsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ingredientSubstitutesRefs)
                        await $_getPrefetchedData<
                          Recipe,
                          $RecipesTable,
                          IngredientSubstitute
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._ingredientSubstitutesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).ingredientSubstitutesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recipeStepsRefs)
                        await $_getPrefetchedData<
                          Recipe,
                          $RecipesTable,
                          RecipeStep
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._recipeStepsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeStepsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (plannedMealsRefs)
                        await $_getPrefetchedData<
                          Recipe,
                          $RecipesTable,
                          PlannedMeal
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._plannedMealsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).plannedMealsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cookedMealsRefs)
                        await $_getPrefetchedData<
                          Recipe,
                          $RecipesTable,
                          CookedMeal
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._cookedMealsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).cookedMealsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipesTable,
      Recipe,
      $$RecipesTableFilterComposer,
      $$RecipesTableOrderingComposer,
      $$RecipesTableAnnotationComposer,
      $$RecipesTableCreateCompanionBuilder,
      $$RecipesTableUpdateCompanionBuilder,
      (Recipe, $$RecipesTableReferences),
      Recipe,
      PrefetchHooks Function({
        bool recipeIngredientsRefs,
        bool ingredientSubstitutesRefs,
        bool recipeStepsRefs,
        bool plannedMealsRefs,
        bool cookedMealsRefs,
      })
    >;
typedef $$IngredientCatalogTableCreateCompanionBuilder =
    IngredientCatalogCompanion Function({
      required String id,
      required String ingredientKey,
      required String displayName,
      Value<String?> defaultUnit,
      Value<String?> category,
      Value<String?> aliases,
      Value<bool> isSystem,
      Value<String?> createdByUser,
      Value<String?> defaultStorageSpaceId,
      Value<bool> isFood,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$IngredientCatalogTableUpdateCompanionBuilder =
    IngredientCatalogCompanion Function({
      Value<String> id,
      Value<String> ingredientKey,
      Value<String> displayName,
      Value<String?> defaultUnit,
      Value<String?> category,
      Value<String?> aliases,
      Value<bool> isSystem,
      Value<String?> createdByUser,
      Value<String?> defaultStorageSpaceId,
      Value<bool> isFood,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$IngredientCatalogTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $IngredientCatalogTable,
          IngredientCatalogData
        > {
  $$IngredientCatalogTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$RecipeIngredientsTable, List<RecipeIngredient>>
  _recipeIngredientsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeIngredients,
        aliasName: $_aliasNameGenerator(
          db.ingredientCatalog.id,
          db.recipeIngredients.ingredientId,
        ),
      );

  $$RecipeIngredientsTableProcessedTableManager get recipeIngredientsRefs {
    final manager = $$RecipeIngredientsTableTableManager(
      $_db,
      $_db.recipeIngredients,
    ).filter((f) => f.ingredientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IngredientCatalogTableFilterComposer
    extends Composer<_$AppDatabase, $IngredientCatalogTable> {
  $$IngredientCatalogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredientKey => $composableBuilder(
    column: $table.ingredientKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aliases => $composableBuilder(
    column: $table.aliases,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByUser => $composableBuilder(
    column: $table.createdByUser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultStorageSpaceId => $composableBuilder(
    column: $table.defaultStorageSpaceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFood => $composableBuilder(
    column: $table.isFood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeIngredientsRefs(
    Expression<bool> Function($$RecipeIngredientsTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredients,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientsTableFilterComposer(
            $db: $db,
            $table: $db.recipeIngredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IngredientCatalogTableOrderingComposer
    extends Composer<_$AppDatabase, $IngredientCatalogTable> {
  $$IngredientCatalogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredientKey => $composableBuilder(
    column: $table.ingredientKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aliases => $composableBuilder(
    column: $table.aliases,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByUser => $composableBuilder(
    column: $table.createdByUser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultStorageSpaceId => $composableBuilder(
    column: $table.defaultStorageSpaceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFood => $composableBuilder(
    column: $table.isFood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IngredientCatalogTableAnnotationComposer
    extends Composer<_$AppDatabase, $IngredientCatalogTable> {
  $$IngredientCatalogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ingredientKey => $composableBuilder(
    column: $table.ingredientKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get aliases =>
      $composableBuilder(column: $table.aliases, builder: (column) => column);

  GeneratedColumn<bool> get isSystem =>
      $composableBuilder(column: $table.isSystem, builder: (column) => column);

  GeneratedColumn<String> get createdByUser => $composableBuilder(
    column: $table.createdByUser,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultStorageSpaceId => $composableBuilder(
    column: $table.defaultStorageSpaceId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFood =>
      $composableBuilder(column: $table.isFood, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> recipeIngredientsRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientsTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredients,
          getReferencedColumn: (t) => t.ingredientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeIngredients,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$IngredientCatalogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IngredientCatalogTable,
          IngredientCatalogData,
          $$IngredientCatalogTableFilterComposer,
          $$IngredientCatalogTableOrderingComposer,
          $$IngredientCatalogTableAnnotationComposer,
          $$IngredientCatalogTableCreateCompanionBuilder,
          $$IngredientCatalogTableUpdateCompanionBuilder,
          (IngredientCatalogData, $$IngredientCatalogTableReferences),
          IngredientCatalogData,
          PrefetchHooks Function({bool recipeIngredientsRefs})
        > {
  $$IngredientCatalogTableTableManager(
    _$AppDatabase db,
    $IngredientCatalogTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientCatalogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IngredientCatalogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IngredientCatalogTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ingredientKey = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String?> defaultUnit = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> aliases = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<String?> createdByUser = const Value.absent(),
                Value<String?> defaultStorageSpaceId = const Value.absent(),
                Value<bool> isFood = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IngredientCatalogCompanion(
                id: id,
                ingredientKey: ingredientKey,
                displayName: displayName,
                defaultUnit: defaultUnit,
                category: category,
                aliases: aliases,
                isSystem: isSystem,
                createdByUser: createdByUser,
                defaultStorageSpaceId: defaultStorageSpaceId,
                isFood: isFood,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ingredientKey,
                required String displayName,
                Value<String?> defaultUnit = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> aliases = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<String?> createdByUser = const Value.absent(),
                Value<String?> defaultStorageSpaceId = const Value.absent(),
                Value<bool> isFood = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => IngredientCatalogCompanion.insert(
                id: id,
                ingredientKey: ingredientKey,
                displayName: displayName,
                defaultUnit: defaultUnit,
                category: category,
                aliases: aliases,
                isSystem: isSystem,
                createdByUser: createdByUser,
                defaultStorageSpaceId: defaultStorageSpaceId,
                isFood: isFood,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IngredientCatalogTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeIngredientsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recipeIngredientsRefs) db.recipeIngredients,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeIngredientsRefs)
                    await $_getPrefetchedData<
                      IngredientCatalogData,
                      $IngredientCatalogTable,
                      RecipeIngredient
                    >(
                      currentTable: table,
                      referencedTable: $$IngredientCatalogTableReferences
                          ._recipeIngredientsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$IngredientCatalogTableReferences(
                            db,
                            table,
                            p0,
                          ).recipeIngredientsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.ingredientId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$IngredientCatalogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IngredientCatalogTable,
      IngredientCatalogData,
      $$IngredientCatalogTableFilterComposer,
      $$IngredientCatalogTableOrderingComposer,
      $$IngredientCatalogTableAnnotationComposer,
      $$IngredientCatalogTableCreateCompanionBuilder,
      $$IngredientCatalogTableUpdateCompanionBuilder,
      (IngredientCatalogData, $$IngredientCatalogTableReferences),
      IngredientCatalogData,
      PrefetchHooks Function({bool recipeIngredientsRefs})
    >;
typedef $$RecipeIngredientsTableCreateCompanionBuilder =
    RecipeIngredientsCompanion Function({
      required String id,
      required String recipeId,
      Value<String?> ingredientId,
      required String ingredientKey,
      required String displayName,
      Value<double?> quantity,
      Value<String?> unit,
      Value<String?> note,
      required int sortOrder,
      Value<int> rowid,
    });
typedef $$RecipeIngredientsTableUpdateCompanionBuilder =
    RecipeIngredientsCompanion Function({
      Value<String> id,
      Value<String> recipeId,
      Value<String?> ingredientId,
      Value<String> ingredientKey,
      Value<String> displayName,
      Value<double?> quantity,
      Value<String?> unit,
      Value<String?> note,
      Value<int> sortOrder,
      Value<int> rowid,
    });

final class $$RecipeIngredientsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeIngredientsTable,
          RecipeIngredient
        > {
  $$RecipeIngredientsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.recipeIngredients.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $IngredientCatalogTable _ingredientIdTable(_$AppDatabase db) =>
      db.ingredientCatalog.createAlias(
        $_aliasNameGenerator(
          db.recipeIngredients.ingredientId,
          db.ingredientCatalog.id,
        ),
      );

  $$IngredientCatalogTableProcessedTableManager? get ingredientId {
    final $_column = $_itemColumn<String>('ingredient_id');
    if ($_column == null) return null;
    final manager = $$IngredientCatalogTableTableManager(
      $_db,
      $_db.ingredientCatalog,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ingredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $IngredientSubstitutesTable,
    List<IngredientSubstitute>
  >
  _ingredientSubstitutesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.ingredientSubstitutes,
        aliasName: $_aliasNameGenerator(
          db.recipeIngredients.id,
          db.ingredientSubstitutes.recipeIngredientId,
        ),
      );

  $$IngredientSubstitutesTableProcessedTableManager
  get ingredientSubstitutesRefs {
    final manager =
        $$IngredientSubstitutesTableTableManager(
          $_db,
          $_db.ingredientSubstitutes,
        ).filter(
          (f) => f.recipeIngredientId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _ingredientSubstitutesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipeIngredientsTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredientKey => $composableBuilder(
    column: $table.ingredientKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientCatalogTableFilterComposer get ingredientId {
    final $$IngredientCatalogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientCatalogTableFilterComposer(
            $db: $db,
            $table: $db.ingredientCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> ingredientSubstitutesRefs(
    Expression<bool> Function($$IngredientSubstitutesTableFilterComposer f) f,
  ) {
    final $$IngredientSubstitutesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.ingredientSubstitutes,
          getReferencedColumn: (t) => t.recipeIngredientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IngredientSubstitutesTableFilterComposer(
                $db: $db,
                $table: $db.ingredientSubstitutes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecipeIngredientsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredientKey => $composableBuilder(
    column: $table.ingredientKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientCatalogTableOrderingComposer get ingredientId {
    final $$IngredientCatalogTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientCatalogTableOrderingComposer(
            $db: $db,
            $table: $db.ingredientCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ingredientKey => $composableBuilder(
    column: $table.ingredientKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientCatalogTableAnnotationComposer get ingredientId {
    final $$IngredientCatalogTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.ingredientId,
          referencedTable: $db.ingredientCatalog,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IngredientCatalogTableAnnotationComposer(
                $db: $db,
                $table: $db.ingredientCatalog,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> ingredientSubstitutesRefs<T extends Object>(
    Expression<T> Function($$IngredientSubstitutesTableAnnotationComposer a) f,
  ) {
    final $$IngredientSubstitutesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.ingredientSubstitutes,
          getReferencedColumn: (t) => t.recipeIngredientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IngredientSubstitutesTableAnnotationComposer(
                $db: $db,
                $table: $db.ingredientSubstitutes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecipeIngredientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeIngredientsTable,
          RecipeIngredient,
          $$RecipeIngredientsTableFilterComposer,
          $$RecipeIngredientsTableOrderingComposer,
          $$RecipeIngredientsTableAnnotationComposer,
          $$RecipeIngredientsTableCreateCompanionBuilder,
          $$RecipeIngredientsTableUpdateCompanionBuilder,
          (RecipeIngredient, $$RecipeIngredientsTableReferences),
          RecipeIngredient,
          PrefetchHooks Function({
            bool recipeId,
            bool ingredientId,
            bool ingredientSubstitutesRefs,
          })
        > {
  $$RecipeIngredientsTableTableManager(
    _$AppDatabase db,
    $RecipeIngredientsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeIngredientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeIngredientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeIngredientsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<String?> ingredientId = const Value.absent(),
                Value<String> ingredientKey = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<double?> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeIngredientsCompanion(
                id: id,
                recipeId: recipeId,
                ingredientId: ingredientId,
                ingredientKey: ingredientKey,
                displayName: displayName,
                quantity: quantity,
                unit: unit,
                note: note,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String recipeId,
                Value<String?> ingredientId = const Value.absent(),
                required String ingredientKey,
                required String displayName,
                Value<double?> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => RecipeIngredientsCompanion.insert(
                id: id,
                recipeId: recipeId,
                ingredientId: ingredientId,
                ingredientKey: ingredientKey,
                displayName: displayName,
                quantity: quantity,
                unit: unit,
                note: note,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeIngredientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                recipeId = false,
                ingredientId = false,
                ingredientSubstitutesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (ingredientSubstitutesRefs) db.ingredientSubstitutes,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (recipeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recipeId,
                                    referencedTable:
                                        $$RecipeIngredientsTableReferences
                                            ._recipeIdTable(db),
                                    referencedColumn:
                                        $$RecipeIngredientsTableReferences
                                            ._recipeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (ingredientId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ingredientId,
                                    referencedTable:
                                        $$RecipeIngredientsTableReferences
                                            ._ingredientIdTable(db),
                                    referencedColumn:
                                        $$RecipeIngredientsTableReferences
                                            ._ingredientIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (ingredientSubstitutesRefs)
                        await $_getPrefetchedData<
                          RecipeIngredient,
                          $RecipeIngredientsTable,
                          IngredientSubstitute
                        >(
                          currentTable: table,
                          referencedTable: $$RecipeIngredientsTableReferences
                              ._ingredientSubstitutesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipeIngredientsTableReferences(
                                db,
                                table,
                                p0,
                              ).ingredientSubstitutesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeIngredientId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecipeIngredientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeIngredientsTable,
      RecipeIngredient,
      $$RecipeIngredientsTableFilterComposer,
      $$RecipeIngredientsTableOrderingComposer,
      $$RecipeIngredientsTableAnnotationComposer,
      $$RecipeIngredientsTableCreateCompanionBuilder,
      $$RecipeIngredientsTableUpdateCompanionBuilder,
      (RecipeIngredient, $$RecipeIngredientsTableReferences),
      RecipeIngredient,
      PrefetchHooks Function({
        bool recipeId,
        bool ingredientId,
        bool ingredientSubstitutesRefs,
      })
    >;
typedef $$IngredientSubstitutesTableCreateCompanionBuilder =
    IngredientSubstitutesCompanion Function({
      required String id,
      required String recipeId,
      required String recipeIngredientId,
      required String substituteIngredientKey,
      required String substituteDisplayName,
      Value<double?> quantity,
      Value<String?> unit,
      Value<String?> note,
      required int sortOrder,
      Value<int> rowid,
    });
typedef $$IngredientSubstitutesTableUpdateCompanionBuilder =
    IngredientSubstitutesCompanion Function({
      Value<String> id,
      Value<String> recipeId,
      Value<String> recipeIngredientId,
      Value<String> substituteIngredientKey,
      Value<String> substituteDisplayName,
      Value<double?> quantity,
      Value<String?> unit,
      Value<String?> note,
      Value<int> sortOrder,
      Value<int> rowid,
    });

final class $$IngredientSubstitutesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $IngredientSubstitutesTable,
          IngredientSubstitute
        > {
  $$IngredientSubstitutesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.ingredientSubstitutes.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RecipeIngredientsTable _recipeIngredientIdTable(_$AppDatabase db) =>
      db.recipeIngredients.createAlias(
        $_aliasNameGenerator(
          db.ingredientSubstitutes.recipeIngredientId,
          db.recipeIngredients.id,
        ),
      );

  $$RecipeIngredientsTableProcessedTableManager get recipeIngredientId {
    final $_column = $_itemColumn<String>('recipe_ingredient_id')!;

    final manager = $$RecipeIngredientsTableTableManager(
      $_db,
      $_db.recipeIngredients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIngredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IngredientSubstitutesTableFilterComposer
    extends Composer<_$AppDatabase, $IngredientSubstitutesTable> {
  $$IngredientSubstitutesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get substituteIngredientKey => $composableBuilder(
    column: $table.substituteIngredientKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get substituteDisplayName => $composableBuilder(
    column: $table.substituteDisplayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeIngredientsTableFilterComposer get recipeIngredientId {
    final $$RecipeIngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeIngredientId,
      referencedTable: $db.recipeIngredients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientsTableFilterComposer(
            $db: $db,
            $table: $db.recipeIngredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientSubstitutesTableOrderingComposer
    extends Composer<_$AppDatabase, $IngredientSubstitutesTable> {
  $$IngredientSubstitutesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get substituteIngredientKey => $composableBuilder(
    column: $table.substituteIngredientKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get substituteDisplayName => $composableBuilder(
    column: $table.substituteDisplayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeIngredientsTableOrderingComposer get recipeIngredientId {
    final $$RecipeIngredientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeIngredientId,
      referencedTable: $db.recipeIngredients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientsTableOrderingComposer(
            $db: $db,
            $table: $db.recipeIngredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientSubstitutesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IngredientSubstitutesTable> {
  $$IngredientSubstitutesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get substituteIngredientKey => $composableBuilder(
    column: $table.substituteIngredientKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get substituteDisplayName => $composableBuilder(
    column: $table.substituteDisplayName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeIngredientsTableAnnotationComposer get recipeIngredientId {
    final $$RecipeIngredientsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.recipeIngredientId,
          referencedTable: $db.recipeIngredients,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeIngredients,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$IngredientSubstitutesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IngredientSubstitutesTable,
          IngredientSubstitute,
          $$IngredientSubstitutesTableFilterComposer,
          $$IngredientSubstitutesTableOrderingComposer,
          $$IngredientSubstitutesTableAnnotationComposer,
          $$IngredientSubstitutesTableCreateCompanionBuilder,
          $$IngredientSubstitutesTableUpdateCompanionBuilder,
          (IngredientSubstitute, $$IngredientSubstitutesTableReferences),
          IngredientSubstitute,
          PrefetchHooks Function({bool recipeId, bool recipeIngredientId})
        > {
  $$IngredientSubstitutesTableTableManager(
    _$AppDatabase db,
    $IngredientSubstitutesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientSubstitutesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$IngredientSubstitutesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$IngredientSubstitutesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<String> recipeIngredientId = const Value.absent(),
                Value<String> substituteIngredientKey = const Value.absent(),
                Value<String> substituteDisplayName = const Value.absent(),
                Value<double?> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IngredientSubstitutesCompanion(
                id: id,
                recipeId: recipeId,
                recipeIngredientId: recipeIngredientId,
                substituteIngredientKey: substituteIngredientKey,
                substituteDisplayName: substituteDisplayName,
                quantity: quantity,
                unit: unit,
                note: note,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String recipeId,
                required String recipeIngredientId,
                required String substituteIngredientKey,
                required String substituteDisplayName,
                Value<double?> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => IngredientSubstitutesCompanion.insert(
                id: id,
                recipeId: recipeId,
                recipeIngredientId: recipeIngredientId,
                substituteIngredientKey: substituteIngredientKey,
                substituteDisplayName: substituteDisplayName,
                quantity: quantity,
                unit: unit,
                note: note,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IngredientSubstitutesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({recipeId = false, recipeIngredientId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (recipeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recipeId,
                                    referencedTable:
                                        $$IngredientSubstitutesTableReferences
                                            ._recipeIdTable(db),
                                    referencedColumn:
                                        $$IngredientSubstitutesTableReferences
                                            ._recipeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (recipeIngredientId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recipeIngredientId,
                                    referencedTable:
                                        $$IngredientSubstitutesTableReferences
                                            ._recipeIngredientIdTable(db),
                                    referencedColumn:
                                        $$IngredientSubstitutesTableReferences
                                            ._recipeIngredientIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$IngredientSubstitutesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IngredientSubstitutesTable,
      IngredientSubstitute,
      $$IngredientSubstitutesTableFilterComposer,
      $$IngredientSubstitutesTableOrderingComposer,
      $$IngredientSubstitutesTableAnnotationComposer,
      $$IngredientSubstitutesTableCreateCompanionBuilder,
      $$IngredientSubstitutesTableUpdateCompanionBuilder,
      (IngredientSubstitute, $$IngredientSubstitutesTableReferences),
      IngredientSubstitute,
      PrefetchHooks Function({bool recipeId, bool recipeIngredientId})
    >;
typedef $$RecipeStepsTableCreateCompanionBuilder =
    RecipeStepsCompanion Function({
      required String id,
      required String recipeId,
      Value<String?> sectionName,
      required int stepNumber,
      required String instruction,
      Value<int?> timerMinutes,
      required int sortOrder,
      Value<int> rowid,
    });
typedef $$RecipeStepsTableUpdateCompanionBuilder =
    RecipeStepsCompanion Function({
      Value<String> id,
      Value<String> recipeId,
      Value<String?> sectionName,
      Value<int> stepNumber,
      Value<String> instruction,
      Value<int?> timerMinutes,
      Value<int> sortOrder,
      Value<int> rowid,
    });

final class $$RecipeStepsTableReferences
    extends BaseReferences<_$AppDatabase, $RecipeStepsTable, RecipeStep> {
  $$RecipeStepsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.recipeSteps.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecipeStepsTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeStepsTable> {
  $$RecipeStepsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sectionName => $composableBuilder(
    column: $table.sectionName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stepNumber => $composableBuilder(
    column: $table.stepNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instruction => $composableBuilder(
    column: $table.instruction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timerMinutes => $composableBuilder(
    column: $table.timerMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeStepsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeStepsTable> {
  $$RecipeStepsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sectionName => $composableBuilder(
    column: $table.sectionName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stepNumber => $composableBuilder(
    column: $table.stepNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instruction => $composableBuilder(
    column: $table.instruction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timerMinutes => $composableBuilder(
    column: $table.timerMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeStepsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeStepsTable> {
  $$RecipeStepsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sectionName => $composableBuilder(
    column: $table.sectionName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stepNumber => $composableBuilder(
    column: $table.stepNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get instruction => $composableBuilder(
    column: $table.instruction,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timerMinutes => $composableBuilder(
    column: $table.timerMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeStepsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeStepsTable,
          RecipeStep,
          $$RecipeStepsTableFilterComposer,
          $$RecipeStepsTableOrderingComposer,
          $$RecipeStepsTableAnnotationComposer,
          $$RecipeStepsTableCreateCompanionBuilder,
          $$RecipeStepsTableUpdateCompanionBuilder,
          (RecipeStep, $$RecipeStepsTableReferences),
          RecipeStep,
          PrefetchHooks Function({bool recipeId})
        > {
  $$RecipeStepsTableTableManager(_$AppDatabase db, $RecipeStepsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeStepsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeStepsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeStepsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<String?> sectionName = const Value.absent(),
                Value<int> stepNumber = const Value.absent(),
                Value<String> instruction = const Value.absent(),
                Value<int?> timerMinutes = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeStepsCompanion(
                id: id,
                recipeId: recipeId,
                sectionName: sectionName,
                stepNumber: stepNumber,
                instruction: instruction,
                timerMinutes: timerMinutes,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String recipeId,
                Value<String?> sectionName = const Value.absent(),
                required int stepNumber,
                required String instruction,
                Value<int?> timerMinutes = const Value.absent(),
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => RecipeStepsCompanion.insert(
                id: id,
                recipeId: recipeId,
                sectionName: sectionName,
                stepNumber: stepNumber,
                instruction: instruction,
                timerMinutes: timerMinutes,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeStepsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable: $$RecipeStepsTableReferences
                                    ._recipeIdTable(db),
                                referencedColumn: $$RecipeStepsTableReferences
                                    ._recipeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RecipeStepsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeStepsTable,
      RecipeStep,
      $$RecipeStepsTableFilterComposer,
      $$RecipeStepsTableOrderingComposer,
      $$RecipeStepsTableAnnotationComposer,
      $$RecipeStepsTableCreateCompanionBuilder,
      $$RecipeStepsTableUpdateCompanionBuilder,
      (RecipeStep, $$RecipeStepsTableReferences),
      RecipeStep,
      PrefetchHooks Function({bool recipeId})
    >;
typedef $$MealPlansTableCreateCompanionBuilder =
    MealPlansCompanion Function({
      required String id,
      required int weekStartDate,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$MealPlansTableUpdateCompanionBuilder =
    MealPlansCompanion Function({
      Value<String> id,
      Value<int> weekStartDate,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$MealPlansTableReferences
    extends BaseReferences<_$AppDatabase, $MealPlansTable, MealPlan> {
  $$MealPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlannedMealsTable, List<PlannedMeal>>
  _plannedMealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.plannedMeals,
    aliasName: $_aliasNameGenerator(
      db.mealPlans.id,
      db.plannedMeals.mealPlanId,
    ),
  );

  $$PlannedMealsTableProcessedTableManager get plannedMealsRefs {
    final manager = $$PlannedMealsTableTableManager(
      $_db,
      $_db.plannedMeals,
    ).filter((f) => f.mealPlanId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_plannedMealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MealPlansTableFilterComposer
    extends Composer<_$AppDatabase, $MealPlansTable> {
  $$MealPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekStartDate => $composableBuilder(
    column: $table.weekStartDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> plannedMealsRefs(
    Expression<bool> Function($$PlannedMealsTableFilterComposer f) f,
  ) {
    final $$PlannedMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.plannedMeals,
      getReferencedColumn: (t) => t.mealPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlannedMealsTableFilterComposer(
            $db: $db,
            $table: $db.plannedMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $MealPlansTable> {
  $$MealPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekStartDate => $composableBuilder(
    column: $table.weekStartDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MealPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealPlansTable> {
  $$MealPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get weekStartDate => $composableBuilder(
    column: $table.weekStartDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> plannedMealsRefs<T extends Object>(
    Expression<T> Function($$PlannedMealsTableAnnotationComposer a) f,
  ) {
    final $$PlannedMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.plannedMeals,
      getReferencedColumn: (t) => t.mealPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlannedMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.plannedMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealPlansTable,
          MealPlan,
          $$MealPlansTableFilterComposer,
          $$MealPlansTableOrderingComposer,
          $$MealPlansTableAnnotationComposer,
          $$MealPlansTableCreateCompanionBuilder,
          $$MealPlansTableUpdateCompanionBuilder,
          (MealPlan, $$MealPlansTableReferences),
          MealPlan,
          PrefetchHooks Function({bool plannedMealsRefs})
        > {
  $$MealPlansTableTableManager(_$AppDatabase db, $MealPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> weekStartDate = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealPlansCompanion(
                id: id,
                weekStartDate: weekStartDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int weekStartDate,
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => MealPlansCompanion.insert(
                id: id,
                weekStartDate: weekStartDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealPlansTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({plannedMealsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (plannedMealsRefs) db.plannedMeals],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (plannedMealsRefs)
                    await $_getPrefetchedData<
                      MealPlan,
                      $MealPlansTable,
                      PlannedMeal
                    >(
                      currentTable: table,
                      referencedTable: $$MealPlansTableReferences
                          ._plannedMealsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MealPlansTableReferences(
                            db,
                            table,
                            p0,
                          ).plannedMealsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.mealPlanId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MealPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealPlansTable,
      MealPlan,
      $$MealPlansTableFilterComposer,
      $$MealPlansTableOrderingComposer,
      $$MealPlansTableAnnotationComposer,
      $$MealPlansTableCreateCompanionBuilder,
      $$MealPlansTableUpdateCompanionBuilder,
      (MealPlan, $$MealPlansTableReferences),
      MealPlan,
      PrefetchHooks Function({bool plannedMealsRefs})
    >;
typedef $$PlannedMealsTableCreateCompanionBuilder =
    PlannedMealsCompanion Function({
      required String id,
      required String mealPlanId,
      required String recipeId,
      Value<int?> plannedDate,
      Value<String> status,
      Value<int?> cookedAt,
      Value<double?> servingsPlanned,
      Value<double?> servingsRemaining,
      Value<String?> notes,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$PlannedMealsTableUpdateCompanionBuilder =
    PlannedMealsCompanion Function({
      Value<String> id,
      Value<String> mealPlanId,
      Value<String> recipeId,
      Value<int?> plannedDate,
      Value<String> status,
      Value<int?> cookedAt,
      Value<double?> servingsPlanned,
      Value<double?> servingsRemaining,
      Value<String?> notes,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$PlannedMealsTableReferences
    extends BaseReferences<_$AppDatabase, $PlannedMealsTable, PlannedMeal> {
  $$PlannedMealsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MealPlansTable _mealPlanIdTable(_$AppDatabase db) =>
      db.mealPlans.createAlias(
        $_aliasNameGenerator(db.plannedMeals.mealPlanId, db.mealPlans.id),
      );

  $$MealPlansTableProcessedTableManager get mealPlanId {
    final $_column = $_itemColumn<String>('meal_plan_id')!;

    final manager = $$MealPlansTableTableManager(
      $_db,
      $_db.mealPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mealPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.plannedMeals.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlannedMealsTableFilterComposer
    extends Composer<_$AppDatabase, $PlannedMealsTable> {
  $$PlannedMealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get plannedDate => $composableBuilder(
    column: $table.plannedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cookedAt => $composableBuilder(
    column: $table.cookedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get servingsPlanned => $composableBuilder(
    column: $table.servingsPlanned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get servingsRemaining => $composableBuilder(
    column: $table.servingsRemaining,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MealPlansTableFilterComposer get mealPlanId {
    final $$MealPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealPlanId,
      referencedTable: $db.mealPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlansTableFilterComposer(
            $db: $db,
            $table: $db.mealPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlannedMealsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlannedMealsTable> {
  $$PlannedMealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get plannedDate => $composableBuilder(
    column: $table.plannedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cookedAt => $composableBuilder(
    column: $table.cookedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get servingsPlanned => $composableBuilder(
    column: $table.servingsPlanned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get servingsRemaining => $composableBuilder(
    column: $table.servingsRemaining,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MealPlansTableOrderingComposer get mealPlanId {
    final $$MealPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealPlanId,
      referencedTable: $db.mealPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlansTableOrderingComposer(
            $db: $db,
            $table: $db.mealPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlannedMealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlannedMealsTable> {
  $$PlannedMealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get plannedDate => $composableBuilder(
    column: $table.plannedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get cookedAt =>
      $composableBuilder(column: $table.cookedAt, builder: (column) => column);

  GeneratedColumn<double> get servingsPlanned => $composableBuilder(
    column: $table.servingsPlanned,
    builder: (column) => column,
  );

  GeneratedColumn<double> get servingsRemaining => $composableBuilder(
    column: $table.servingsRemaining,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MealPlansTableAnnotationComposer get mealPlanId {
    final $$MealPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealPlanId,
      referencedTable: $db.mealPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.mealPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlannedMealsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlannedMealsTable,
          PlannedMeal,
          $$PlannedMealsTableFilterComposer,
          $$PlannedMealsTableOrderingComposer,
          $$PlannedMealsTableAnnotationComposer,
          $$PlannedMealsTableCreateCompanionBuilder,
          $$PlannedMealsTableUpdateCompanionBuilder,
          (PlannedMeal, $$PlannedMealsTableReferences),
          PlannedMeal,
          PrefetchHooks Function({bool mealPlanId, bool recipeId})
        > {
  $$PlannedMealsTableTableManager(_$AppDatabase db, $PlannedMealsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlannedMealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlannedMealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlannedMealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mealPlanId = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<int?> plannedDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> cookedAt = const Value.absent(),
                Value<double?> servingsPlanned = const Value.absent(),
                Value<double?> servingsRemaining = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlannedMealsCompanion(
                id: id,
                mealPlanId: mealPlanId,
                recipeId: recipeId,
                plannedDate: plannedDate,
                status: status,
                cookedAt: cookedAt,
                servingsPlanned: servingsPlanned,
                servingsRemaining: servingsRemaining,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mealPlanId,
                required String recipeId,
                Value<int?> plannedDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> cookedAt = const Value.absent(),
                Value<double?> servingsPlanned = const Value.absent(),
                Value<double?> servingsRemaining = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PlannedMealsCompanion.insert(
                id: id,
                mealPlanId: mealPlanId,
                recipeId: recipeId,
                plannedDate: plannedDate,
                status: status,
                cookedAt: cookedAt,
                servingsPlanned: servingsPlanned,
                servingsRemaining: servingsRemaining,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlannedMealsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mealPlanId = false, recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mealPlanId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mealPlanId,
                                referencedTable: $$PlannedMealsTableReferences
                                    ._mealPlanIdTable(db),
                                referencedColumn: $$PlannedMealsTableReferences
                                    ._mealPlanIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable: $$PlannedMealsTableReferences
                                    ._recipeIdTable(db),
                                referencedColumn: $$PlannedMealsTableReferences
                                    ._recipeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PlannedMealsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlannedMealsTable,
      PlannedMeal,
      $$PlannedMealsTableFilterComposer,
      $$PlannedMealsTableOrderingComposer,
      $$PlannedMealsTableAnnotationComposer,
      $$PlannedMealsTableCreateCompanionBuilder,
      $$PlannedMealsTableUpdateCompanionBuilder,
      (PlannedMeal, $$PlannedMealsTableReferences),
      PlannedMeal,
      PrefetchHooks Function({bool mealPlanId, bool recipeId})
    >;
typedef $$CookedMealsTableCreateCompanionBuilder =
    CookedMealsCompanion Function({
      required String id,
      required String recipeId,
      Value<String?> plannedMealId,
      required int cookedAt,
      required double servingsCooked,
      required double servingsRemaining,
      Value<int?> estimatedGoodUntil,
      Value<String?> notes,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$CookedMealsTableUpdateCompanionBuilder =
    CookedMealsCompanion Function({
      Value<String> id,
      Value<String> recipeId,
      Value<String?> plannedMealId,
      Value<int> cookedAt,
      Value<double> servingsCooked,
      Value<double> servingsRemaining,
      Value<int?> estimatedGoodUntil,
      Value<String?> notes,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$CookedMealsTableReferences
    extends BaseReferences<_$AppDatabase, $CookedMealsTable, CookedMeal> {
  $$CookedMealsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.cookedMeals.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CookedMealsTableFilterComposer
    extends Composer<_$AppDatabase, $CookedMealsTable> {
  $$CookedMealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plannedMealId => $composableBuilder(
    column: $table.plannedMealId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cookedAt => $composableBuilder(
    column: $table.cookedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get servingsCooked => $composableBuilder(
    column: $table.servingsCooked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get servingsRemaining => $composableBuilder(
    column: $table.servingsRemaining,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedGoodUntil => $composableBuilder(
    column: $table.estimatedGoodUntil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CookedMealsTableOrderingComposer
    extends Composer<_$AppDatabase, $CookedMealsTable> {
  $$CookedMealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plannedMealId => $composableBuilder(
    column: $table.plannedMealId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cookedAt => $composableBuilder(
    column: $table.cookedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get servingsCooked => $composableBuilder(
    column: $table.servingsCooked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get servingsRemaining => $composableBuilder(
    column: $table.servingsRemaining,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedGoodUntil => $composableBuilder(
    column: $table.estimatedGoodUntil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CookedMealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CookedMealsTable> {
  $$CookedMealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get plannedMealId => $composableBuilder(
    column: $table.plannedMealId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cookedAt =>
      $composableBuilder(column: $table.cookedAt, builder: (column) => column);

  GeneratedColumn<double> get servingsCooked => $composableBuilder(
    column: $table.servingsCooked,
    builder: (column) => column,
  );

  GeneratedColumn<double> get servingsRemaining => $composableBuilder(
    column: $table.servingsRemaining,
    builder: (column) => column,
  );

  GeneratedColumn<int> get estimatedGoodUntil => $composableBuilder(
    column: $table.estimatedGoodUntil,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CookedMealsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CookedMealsTable,
          CookedMeal,
          $$CookedMealsTableFilterComposer,
          $$CookedMealsTableOrderingComposer,
          $$CookedMealsTableAnnotationComposer,
          $$CookedMealsTableCreateCompanionBuilder,
          $$CookedMealsTableUpdateCompanionBuilder,
          (CookedMeal, $$CookedMealsTableReferences),
          CookedMeal,
          PrefetchHooks Function({bool recipeId})
        > {
  $$CookedMealsTableTableManager(_$AppDatabase db, $CookedMealsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CookedMealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CookedMealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CookedMealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<String?> plannedMealId = const Value.absent(),
                Value<int> cookedAt = const Value.absent(),
                Value<double> servingsCooked = const Value.absent(),
                Value<double> servingsRemaining = const Value.absent(),
                Value<int?> estimatedGoodUntil = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CookedMealsCompanion(
                id: id,
                recipeId: recipeId,
                plannedMealId: plannedMealId,
                cookedAt: cookedAt,
                servingsCooked: servingsCooked,
                servingsRemaining: servingsRemaining,
                estimatedGoodUntil: estimatedGoodUntil,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String recipeId,
                Value<String?> plannedMealId = const Value.absent(),
                required int cookedAt,
                required double servingsCooked,
                required double servingsRemaining,
                Value<int?> estimatedGoodUntil = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CookedMealsCompanion.insert(
                id: id,
                recipeId: recipeId,
                plannedMealId: plannedMealId,
                cookedAt: cookedAt,
                servingsCooked: servingsCooked,
                servingsRemaining: servingsRemaining,
                estimatedGoodUntil: estimatedGoodUntil,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CookedMealsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable: $$CookedMealsTableReferences
                                    ._recipeIdTable(db),
                                referencedColumn: $$CookedMealsTableReferences
                                    ._recipeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CookedMealsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CookedMealsTable,
      CookedMeal,
      $$CookedMealsTableFilterComposer,
      $$CookedMealsTableOrderingComposer,
      $$CookedMealsTableAnnotationComposer,
      $$CookedMealsTableCreateCompanionBuilder,
      $$CookedMealsTableUpdateCompanionBuilder,
      (CookedMeal, $$CookedMealsTableReferences),
      CookedMeal,
      PrefetchHooks Function({bool recipeId})
    >;
typedef $$StorageSpacesTableCreateCompanionBuilder =
    StorageSpacesCompanion Function({
      required String id,
      required String name,
      Value<int> sortOrder,
      Value<bool> isSystem,
      Value<String?> createdByUser,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$StorageSpacesTableUpdateCompanionBuilder =
    StorageSpacesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> sortOrder,
      Value<bool> isSystem,
      Value<String?> createdByUser,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$StorageSpacesTableReferences
    extends BaseReferences<_$AppDatabase, $StorageSpacesTable, StorageSpace> {
  $$StorageSpacesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$HomeInventoryItemsTable, List<HomeInventoryItem>>
  _homeInventoryItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.homeInventoryItems,
        aliasName: $_aliasNameGenerator(
          db.storageSpaces.id,
          db.homeInventoryItems.storageSpaceId,
        ),
      );

  $$HomeInventoryItemsTableProcessedTableManager get homeInventoryItemsRefs {
    final manager = $$HomeInventoryItemsTableTableManager(
      $_db,
      $_db.homeInventoryItems,
    ).filter((f) => f.storageSpaceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _homeInventoryItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StorageSpacesTableFilterComposer
    extends Composer<_$AppDatabase, $StorageSpacesTable> {
  $$StorageSpacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdByUser => $composableBuilder(
    column: $table.createdByUser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> homeInventoryItemsRefs(
    Expression<bool> Function($$HomeInventoryItemsTableFilterComposer f) f,
  ) {
    final $$HomeInventoryItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.homeInventoryItems,
      getReferencedColumn: (t) => t.storageSpaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HomeInventoryItemsTableFilterComposer(
            $db: $db,
            $table: $db.homeInventoryItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StorageSpacesTableOrderingComposer
    extends Composer<_$AppDatabase, $StorageSpacesTable> {
  $$StorageSpacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdByUser => $composableBuilder(
    column: $table.createdByUser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StorageSpacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StorageSpacesTable> {
  $$StorageSpacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isSystem =>
      $composableBuilder(column: $table.isSystem, builder: (column) => column);

  GeneratedColumn<String> get createdByUser => $composableBuilder(
    column: $table.createdByUser,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> homeInventoryItemsRefs<T extends Object>(
    Expression<T> Function($$HomeInventoryItemsTableAnnotationComposer a) f,
  ) {
    final $$HomeInventoryItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.homeInventoryItems,
          getReferencedColumn: (t) => t.storageSpaceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HomeInventoryItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.homeInventoryItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$StorageSpacesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StorageSpacesTable,
          StorageSpace,
          $$StorageSpacesTableFilterComposer,
          $$StorageSpacesTableOrderingComposer,
          $$StorageSpacesTableAnnotationComposer,
          $$StorageSpacesTableCreateCompanionBuilder,
          $$StorageSpacesTableUpdateCompanionBuilder,
          (StorageSpace, $$StorageSpacesTableReferences),
          StorageSpace,
          PrefetchHooks Function({bool homeInventoryItemsRefs})
        > {
  $$StorageSpacesTableTableManager(_$AppDatabase db, $StorageSpacesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StorageSpacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StorageSpacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StorageSpacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<String?> createdByUser = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StorageSpacesCompanion(
                id: id,
                name: name,
                sortOrder: sortOrder,
                isSystem: isSystem,
                createdByUser: createdByUser,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<String?> createdByUser = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => StorageSpacesCompanion.insert(
                id: id,
                name: name,
                sortOrder: sortOrder,
                isSystem: isSystem,
                createdByUser: createdByUser,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StorageSpacesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({homeInventoryItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (homeInventoryItemsRefs) db.homeInventoryItems,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (homeInventoryItemsRefs)
                    await $_getPrefetchedData<
                      StorageSpace,
                      $StorageSpacesTable,
                      HomeInventoryItem
                    >(
                      currentTable: table,
                      referencedTable: $$StorageSpacesTableReferences
                          ._homeInventoryItemsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$StorageSpacesTableReferences(
                            db,
                            table,
                            p0,
                          ).homeInventoryItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.storageSpaceId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$StorageSpacesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StorageSpacesTable,
      StorageSpace,
      $$StorageSpacesTableFilterComposer,
      $$StorageSpacesTableOrderingComposer,
      $$StorageSpacesTableAnnotationComposer,
      $$StorageSpacesTableCreateCompanionBuilder,
      $$StorageSpacesTableUpdateCompanionBuilder,
      (StorageSpace, $$StorageSpacesTableReferences),
      StorageSpace,
      PrefetchHooks Function({bool homeInventoryItemsRefs})
    >;
typedef $$HomeInventoryItemsTableCreateCompanionBuilder =
    HomeInventoryItemsCompanion Function({
      required String id,
      Value<String?> itemCatalogId,
      required String itemKey,
      required String displayName,
      Value<double> quantity,
      Value<String?> unit,
      required String storageSpaceId,
      Value<int?> acquiredAt,
      Value<int?> openedAt,
      Value<int?> expiresAt,
      Value<String?> notes,
      Value<String?> sourceType,
      Value<bool> isConsumed,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$HomeInventoryItemsTableUpdateCompanionBuilder =
    HomeInventoryItemsCompanion Function({
      Value<String> id,
      Value<String?> itemCatalogId,
      Value<String> itemKey,
      Value<String> displayName,
      Value<double> quantity,
      Value<String?> unit,
      Value<String> storageSpaceId,
      Value<int?> acquiredAt,
      Value<int?> openedAt,
      Value<int?> expiresAt,
      Value<String?> notes,
      Value<String?> sourceType,
      Value<bool> isConsumed,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$HomeInventoryItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HomeInventoryItemsTable,
          HomeInventoryItem
        > {
  $$HomeInventoryItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StorageSpacesTable _storageSpaceIdTable(_$AppDatabase db) =>
      db.storageSpaces.createAlias(
        $_aliasNameGenerator(
          db.homeInventoryItems.storageSpaceId,
          db.storageSpaces.id,
        ),
      );

  $$StorageSpacesTableProcessedTableManager get storageSpaceId {
    final $_column = $_itemColumn<String>('storage_space_id')!;

    final manager = $$StorageSpacesTableTableManager(
      $_db,
      $_db.storageSpaces,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_storageSpaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HomeInventoryItemsTableFilterComposer
    extends Composer<_$AppDatabase, $HomeInventoryItemsTable> {
  $$HomeInventoryItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemCatalogId => $composableBuilder(
    column: $table.itemCatalogId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemKey => $composableBuilder(
    column: $table.itemKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get acquiredAt => $composableBuilder(
    column: $table.acquiredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get openedAt => $composableBuilder(
    column: $table.openedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isConsumed => $composableBuilder(
    column: $table.isConsumed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StorageSpacesTableFilterComposer get storageSpaceId {
    final $$StorageSpacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.storageSpaceId,
      referencedTable: $db.storageSpaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StorageSpacesTableFilterComposer(
            $db: $db,
            $table: $db.storageSpaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HomeInventoryItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $HomeInventoryItemsTable> {
  $$HomeInventoryItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemCatalogId => $composableBuilder(
    column: $table.itemCatalogId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemKey => $composableBuilder(
    column: $table.itemKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get acquiredAt => $composableBuilder(
    column: $table.acquiredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get openedAt => $composableBuilder(
    column: $table.openedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isConsumed => $composableBuilder(
    column: $table.isConsumed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StorageSpacesTableOrderingComposer get storageSpaceId {
    final $$StorageSpacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.storageSpaceId,
      referencedTable: $db.storageSpaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StorageSpacesTableOrderingComposer(
            $db: $db,
            $table: $db.storageSpaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HomeInventoryItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HomeInventoryItemsTable> {
  $$HomeInventoryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemCatalogId => $composableBuilder(
    column: $table.itemCatalogId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get itemKey =>
      $composableBuilder(column: $table.itemKey, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get acquiredAt => $composableBuilder(
    column: $table.acquiredAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get openedAt =>
      $composableBuilder(column: $table.openedAt, builder: (column) => column);

  GeneratedColumn<int> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isConsumed => $composableBuilder(
    column: $table.isConsumed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$StorageSpacesTableAnnotationComposer get storageSpaceId {
    final $$StorageSpacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.storageSpaceId,
      referencedTable: $db.storageSpaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StorageSpacesTableAnnotationComposer(
            $db: $db,
            $table: $db.storageSpaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HomeInventoryItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HomeInventoryItemsTable,
          HomeInventoryItem,
          $$HomeInventoryItemsTableFilterComposer,
          $$HomeInventoryItemsTableOrderingComposer,
          $$HomeInventoryItemsTableAnnotationComposer,
          $$HomeInventoryItemsTableCreateCompanionBuilder,
          $$HomeInventoryItemsTableUpdateCompanionBuilder,
          (HomeInventoryItem, $$HomeInventoryItemsTableReferences),
          HomeInventoryItem,
          PrefetchHooks Function({bool storageSpaceId})
        > {
  $$HomeInventoryItemsTableTableManager(
    _$AppDatabase db,
    $HomeInventoryItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HomeInventoryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HomeInventoryItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HomeInventoryItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> itemCatalogId = const Value.absent(),
                Value<String> itemKey = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String> storageSpaceId = const Value.absent(),
                Value<int?> acquiredAt = const Value.absent(),
                Value<int?> openedAt = const Value.absent(),
                Value<int?> expiresAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> sourceType = const Value.absent(),
                Value<bool> isConsumed = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HomeInventoryItemsCompanion(
                id: id,
                itemCatalogId: itemCatalogId,
                itemKey: itemKey,
                displayName: displayName,
                quantity: quantity,
                unit: unit,
                storageSpaceId: storageSpaceId,
                acquiredAt: acquiredAt,
                openedAt: openedAt,
                expiresAt: expiresAt,
                notes: notes,
                sourceType: sourceType,
                isConsumed: isConsumed,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> itemCatalogId = const Value.absent(),
                required String itemKey,
                required String displayName,
                Value<double> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                required String storageSpaceId,
                Value<int?> acquiredAt = const Value.absent(),
                Value<int?> openedAt = const Value.absent(),
                Value<int?> expiresAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> sourceType = const Value.absent(),
                Value<bool> isConsumed = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => HomeInventoryItemsCompanion.insert(
                id: id,
                itemCatalogId: itemCatalogId,
                itemKey: itemKey,
                displayName: displayName,
                quantity: quantity,
                unit: unit,
                storageSpaceId: storageSpaceId,
                acquiredAt: acquiredAt,
                openedAt: openedAt,
                expiresAt: expiresAt,
                notes: notes,
                sourceType: sourceType,
                isConsumed: isConsumed,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HomeInventoryItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({storageSpaceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (storageSpaceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.storageSpaceId,
                                referencedTable:
                                    $$HomeInventoryItemsTableReferences
                                        ._storageSpaceIdTable(db),
                                referencedColumn:
                                    $$HomeInventoryItemsTableReferences
                                        ._storageSpaceIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HomeInventoryItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HomeInventoryItemsTable,
      HomeInventoryItem,
      $$HomeInventoryItemsTableFilterComposer,
      $$HomeInventoryItemsTableOrderingComposer,
      $$HomeInventoryItemsTableAnnotationComposer,
      $$HomeInventoryItemsTableCreateCompanionBuilder,
      $$HomeInventoryItemsTableUpdateCompanionBuilder,
      (HomeInventoryItem, $$HomeInventoryItemsTableReferences),
      HomeInventoryItem,
      PrefetchHooks Function({bool storageSpaceId})
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String id,
      required String key,
      Value<String?> value,
      Value<String?> valueType,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> id,
      Value<String> key,
      Value<String?> value,
      Value<String?> valueType,
      Value<int> updatedAt,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get valueType =>
      $composableBuilder(column: $table.valueType, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<String?> valueType = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                id: id,
                key: key,
                value: value,
                valueType: valueType,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String key,
                Value<String?> value = const Value.absent(),
                Value<String?> valueType = const Value.absent(),
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                id: id,
                key: key,
                value: value,
                valueType: valueType,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$IngredientCatalogTableTableManager get ingredientCatalog =>
      $$IngredientCatalogTableTableManager(_db, _db.ingredientCatalog);
  $$RecipeIngredientsTableTableManager get recipeIngredients =>
      $$RecipeIngredientsTableTableManager(_db, _db.recipeIngredients);
  $$IngredientSubstitutesTableTableManager get ingredientSubstitutes =>
      $$IngredientSubstitutesTableTableManager(_db, _db.ingredientSubstitutes);
  $$RecipeStepsTableTableManager get recipeSteps =>
      $$RecipeStepsTableTableManager(_db, _db.recipeSteps);
  $$MealPlansTableTableManager get mealPlans =>
      $$MealPlansTableTableManager(_db, _db.mealPlans);
  $$PlannedMealsTableTableManager get plannedMeals =>
      $$PlannedMealsTableTableManager(_db, _db.plannedMeals);
  $$CookedMealsTableTableManager get cookedMeals =>
      $$CookedMealsTableTableManager(_db, _db.cookedMeals);
  $$StorageSpacesTableTableManager get storageSpaces =>
      $$StorageSpacesTableTableManager(_db, _db.storageSpaces);
  $$HomeInventoryItemsTableTableManager get homeInventoryItems =>
      $$HomeInventoryItemsTableTableManager(_db, _db.homeInventoryItems);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
