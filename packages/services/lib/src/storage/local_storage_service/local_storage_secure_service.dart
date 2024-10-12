part of services;

final logger = Logger(
  printer: PrettyPrinter(
      methodCount: 1, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

class SercureStorage implements LocalStorage {
  final FlutterSecureStorage _storage;

  SercureStorage._internal(this._storage);

  static SercureStorage getInstance() {
    const box = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
    return SercureStorage._internal(box);
  }

  @override
  Future<bool> cleanUp() async {
    try {
      await _storage.deleteAll();
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  @override
  Future<dynamic> getValue(String key) async {
    var data = await _storage.read(key: key);
    return data;
  }

  @override
  Future<bool> remove(String key) async {
    try {
      await _storage.delete(key: key);
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  @override
  Future<bool> setValue(String key, dynamic value) async {
    try {
      if (value == null) {
        await _storage.delete(key: key);
        return true;
      }
      await _storage.write(
        key: key,
        value: value.toString(),
      );
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}
