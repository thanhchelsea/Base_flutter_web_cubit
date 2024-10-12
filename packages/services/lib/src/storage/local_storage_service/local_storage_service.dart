part of services;

abstract class LocalStorage {
  Future<bool> setValue(String key, dynamic value);
  Future<dynamic> getValue(String key);
  Future<bool> remove(String key);
  Future<bool> cleanUp();
  Future<bool> containsKey(String key);
}
