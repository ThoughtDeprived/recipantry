import '../models/storage_space.dart';

abstract class StorageSpaceRepository {
  Stream<List<StorageSpace>> watchStorageSpaces();
  Future<List<StorageSpace>> getStorageSpaces();
  Future<StorageSpace?> getStorageSpaceByName(String name);
  Future<void> seedDefaultSpaces();
}
