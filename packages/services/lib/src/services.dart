import 'package:get_it/get_it.dart';
import 'package:services/services.dart';

class Services {
  Services._();
  static final GetIt _injector = GetIt.instance;
  static void init() {
    //inject
    _injector
      ..registerSingleton<LocalStorage>(
        SercureStorage.getInstance(),
      )
      ..registerSingleton<AppService>(
        AppServiceImpl(
          localStorageService: GetIt.instance(),
        ),
      );
  }
}
