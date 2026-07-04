class IngredientCatalogItem {
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
  final DateTime createdAt;
  final DateTime updatedAt;

  const IngredientCatalogItem({
    required this.id,
    required this.ingredientKey,
    required this.displayName,
    this.defaultUnit,
    this.category,
    this.aliases,
    this.isSystem = false,
    this.createdByUser,
    this.defaultStorageSpaceId,
    this.isFood = true,
    required this.createdAt,
    required this.updatedAt,
  });

  factory IngredientCatalogItem.fromJson(Map<String, dynamic> json) {
    final now = DateTime.now();
    return IngredientCatalogItem(
      id: (json['id'] ?? json['ingredientKey']) as String,
      ingredientKey: json['ingredientKey'] as String,
      displayName: json['displayName'] as String,
      defaultUnit: json['defaultUnit'] as String?,
      category: json['category'] as String?,
      aliases: json['aliases'] as String?,
      isSystem: json['isSystem'] as bool? ?? true,
      createdByUser: json['createdByUser'] as String?,
      defaultStorageSpaceId: json['defaultStorageSpaceId'] as String?,
      isFood: json['isFood'] as bool? ?? true,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        json['createdAt'] == null
            ? now.millisecondsSinceEpoch
            : json['createdAt'] is int
                ? json['createdAt'] as int
                : int.parse(json['createdAt'].toString()),
      ),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        json['updatedAt'] == null
            ? now.millisecondsSinceEpoch
            : json['updatedAt'] is int
                ? json['updatedAt'] as int
                : int.parse(json['updatedAt'].toString()),
      ),
    );
  }
}
