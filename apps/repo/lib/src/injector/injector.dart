import 'package:common_features/common_features.dart';
import 'package:get_it/get_it.dart';
import 'package:network/network.dart';
import 'package:repo/src/constants/api_config.dart';
import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/injector/modules/bloc_modules.dart';
import 'package:services/services.dart';

class Injector {
  Injector._();
  static GetIt instance = GetIt.instance;

  static void init() {
    Services.init();
    NetworkPackage().init(
      baseUrl: ApiConfig.baseUrl,
      getGetAccessToken: () => instance<AppCubit>().state.accestoken,
    );
    CommonFeatures().init(
      dioInstanceName,
      baseUrl: ApiConfig.baseUrl,
    );
    BlocModule.init();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}
