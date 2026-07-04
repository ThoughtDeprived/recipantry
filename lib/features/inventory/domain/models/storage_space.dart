class StorageSpace {
  final String id;
  final String name;
  final int sortOrder;
  final bool isSystem;
  final String? createdByUser;
  final DateTime createdAt;
  final DateTime updatedAt;

  const StorageSpace({
    required this.id,
    required this.name,
    required this.sortOrder,
    required this.isSystem,
    this.createdByUser,
    required this.createdAt,
    required this.updatedAt,
  });
}
