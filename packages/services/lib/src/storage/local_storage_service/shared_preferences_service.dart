part of services;

class SharedPreferenceStorage implements LocalStorage {
  SharedPreferenceStorage._internal(this.prefs);

  final SharedPreferences prefs;
  static Future<SharedPreferenceStorage> getInstance() async {
    final box = await SharedPreferences.getInstance();
    return SharedPreferenceStorage._internal(box);
  }

  @override
  Future<bool> setValue(String key, dynamic value) async {
    if (value == null) {
      return prefs.remove(key);
    }
    if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    } else if (value is List<String>) {
      return prefs.setStringList(key, value);
    } else {
      throw Exception('Value type is not supported');
    }
  }

  @override
  Future<dynamic> getValue(String key) async {
    try {
      var data = prefs.get(key);
      if (data.toString() == "") {
        return null;
      }
      return data;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> remove(String key) async {
    return await prefs.remove(key);
  }

  @override
  Future<bool> cleanUp() async {
    return await prefs.clear();
  }

  @override
  Future<bool> containsKey(String key) async {
    return prefs.containsKey(key);
  }
}
