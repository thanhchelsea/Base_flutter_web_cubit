part of services;

abstract class AppService {
  Future<dynamic> get locale;
  Future<bool> setLocale({
    required String locale,
  });
  Future<bool> setTheme({
    required ThemeSetting theme,
  });
  Future<ThemeSetting?> getTheme();

  Future<bool> setLoginResponseEntity({required dynamic loginResponse});
  Future<dynamic> getLoginResponseEntity();
  Future<void> removeLoginResponseEntity();
  Future<void> removeUser();
}

enum ThemeSetting {
  light,
  dark,
  system,
}

enum LanguageSetting {
  vi,
  en,
}

extension LanguageExt on LanguageSetting {
  String getTitle() {
    switch (this) {
      case LanguageSetting.vi:
        return 'vi';
      case LanguageSetting.en:
        return 'en';
    }
  }
}
