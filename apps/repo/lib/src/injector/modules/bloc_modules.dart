import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/injector/injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector
      ..registerLazySingleton<AppCubit>(
        () => AppCubit(
          appService: injector(),
        ),
      );
  }
}
