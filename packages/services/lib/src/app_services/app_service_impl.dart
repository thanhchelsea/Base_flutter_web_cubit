part of services;

class AppServiceImpl implements AppService {
  AppServiceImpl({
    required LocalStorage localStorageService,
  }) : _localStorageService = localStorageService;

  final LocalStorage _localStorageService;
  @override
  Future<dynamic> get locale async =>
      await _localStorageService.getValue(PreferenceKey.locale);

  @override
  Future<bool> setLocale({required String locale}) async {
    return _localStorageService.setValue(
      PreferenceKey.locale,
      locale,
    );
  }

  @override
  Future<bool> setTheme({required ThemeSetting theme}) {
    return _localStorageService.setValue(
      PreferenceKey.theme,
      theme.index,
    );
  }

  @override
  Future<ThemeSetting?> getTheme() async {
    final value = await _localStorageService.getValue(PreferenceKey.theme);
    if (value != null) {
      return ThemeSetting.values[value as int];
    }
    return null;
  }

  @override
  Future<bool> setLoginResponseEntity({required dynamic loginResponse}) {
    return _localStorageService.setValue(
      PreferenceKey.loginResponse,
      jsonEncode(loginResponse),
    );
  }

  @override
  Future<dynamic> getLoginResponseEntity() async {
    final currentUser =
        await _localStorageService.getValue(PreferenceKey.loginResponse);
    return currentUser;
  }

  @override
  Future<void> removeLoginResponseEntity() async {
    await _localStorageService.remove(PreferenceKey.loginResponse);
  }

  @override
  Future<void> removeUser() async {
    await _localStorageService.remove(PreferenceKey.userProfile);
  }
}
