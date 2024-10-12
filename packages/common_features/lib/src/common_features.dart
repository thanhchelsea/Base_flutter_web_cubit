import 'package:common_features/auth/data/remote/auth_services/auth_services.dart';
import 'package:common_features/auth/data/repository/auth_repository.dart';
import 'package:common_features/auth/domain/repository/auth_repository.dart';
import 'package:common_features/auth/domain/usecase/auth_usecase.dart';
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
      );
  }

  static void initRepo() {
    getIt
      ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(
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
      );
  }
}
