import 'package:common_features/advert/data/remote/location_service.dart';
import 'package:common_features/advert/data/repository/location_repository.dart';
import 'package:common_features/advert/domain/repository/advert_repository.dart';
import 'package:common_features/advert/domain/usecase/advert_usecase.dart';
import 'package:common_features/auth/data/remote/auth_services/auth_services.dart';
import 'package:common_features/auth/data/repository/auth_repository.dart';
import 'package:common_features/auth/domain/repository/auth_repository.dart';
import 'package:common_features/auth/domain/usecase/auth_usecase.dart';
import 'package:common_features/location/data/remote/location_service.dart';
import 'package:common_features/location/data/repository/location_repository.dart';
import 'package:common_features/location/domain/repository/location_repository.dart';
import 'package:common_features/location/domain/usecase/location_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:retrofit/error_logger.dart';

final getIt = GetIt.instance;

class CommonFeatures {
  void init(
    String dioInstanceName, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) {
    initService(dioInstanceName, baseUrl: baseUrl, errorLogger: errorLogger);
    initRepo();
    initUsecase();
  }

  static void initService(
    String dioInstanceName, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) {
    getIt
      ..registerFactory<AuthService>(
        () => AuthService(),
      )
      ..registerFactory<LocationService>(
        () => LocationService(
          getIt(instanceName: dioInstanceName),
          baseUrl: baseUrl,
        ),
      )
      ..registerFactory<AdvertService>(
        () => AdvertService(
          getIt(instanceName: dioInstanceName),
          baseUrl: baseUrl,
        ),
      );
  }

  static void initRepo() {
    getIt
      ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(
          getIt(),
        ),
      )
      ..registerFactory<LocationRepository>(
        () => LocationRepoImpl(
          getIt(),
        ),
      )
      ..registerFactory<AdvertRepository>(
        () => AdvertRepoImpl(
          getIt(),
        ),
      );
  }

  static void initUsecase() {
    getIt
      ..registerFactory<AuthUsecase>(
        () => AuthUsecase(
          getIt(),
        ),
      )
      ..registerFactory<LocationUsecase>(
        () => LocationUsecase(
          getIt(),
        ),
      )
      ..registerFactory<AdvertUsecase>(
        () => AdvertUsecase(
          getIt(),
        ),
      );
  }
}
