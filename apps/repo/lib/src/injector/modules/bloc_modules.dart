import 'package:repo/src/features/advert/cubit.dart';
import 'package:repo/src/features/advert_detail/cubit.dart';
import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/features/category/cubit.dart';
import 'package:repo/src/features/create_advert/cubit.dart';
import 'package:repo/src/features/create_location/cubit.dart';
import 'package:repo/src/features/home/cubit/cubit.dart';
import 'package:repo/src/features/location/cubit.dart';
import 'package:repo/src/features/location_detail/cubit.dart';
import 'package:repo/src/features/sign_in/cubit/cubit.dart';
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
      )
      ..registerLazySingleton<SignInCubit>(
        () => SignInCubit(
          authUsecase: injector(),
        ),
      )
      ..registerLazySingleton<HomeCubit>(
        () => HomeCubit(
          injector(),
        ),
      )
      ..registerLazySingleton<AdvertCubit>(
        () => AdvertCubit(
          injector(),
        ),
      )
      // ..registerLazySingleton<InsertAdCubit>(
      //   () => InsertAdCubit(),
      // )
      ..registerLazySingleton<LocationCubit>(
        () => LocationCubit(
          injector(),
        ),
      )
      ..registerFactory<CreateAdvertCubit>(
        () => CreateAdvertCubit(
          injector(),
          injector(),
        ),
      )
      ..registerFactory<CategoryCubit>(
        () => CategoryCubit(
          injector(),
        ),
      )
      ..registerFactory<CreateLocationCubit>(
        () => CreateLocationCubit(
          injector(),
          injector(),
        ),
      )
      ..registerFactory<AdvertDetailCubit>(
        () => AdvertDetailCubit(
          injector(),
          injector(),
        ),
      )
      ..registerFactory<LocationDetailCubit>(
        () => LocationDetailCubit(
          injector(),
          injector(),
        ),
      );
  }
}
