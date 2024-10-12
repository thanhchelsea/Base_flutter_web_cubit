import 'dart:io';
import 'package:dio/dio.dart';
import 'network_exceptions.dart';

/// Custom exception from dio error
class ApiException implements Exception {
  ApiException({
    this.status,
    this.message,
    this.data,
  });

  factory ApiException.fromDioError(DioException error) {
    return ApiException(
      status: error.response?.data['status'] as String?,
      message: error.response?.data['message'] as String?,
      data: error.response?.data['data'],
    );
  }
  dynamic data;
  String? message;
  String? status;
}

extension HandleExceptionExtensions<T> on Future<T> {
  Future<T> get onApiError {
    return onError(
      (exception, stackTrace) {
        final DioException dioError = exception as DioException;
        if (dioError.response != null &&
            dioError.response?.statusCode != HttpStatus.ok) {
          throw ApiException.fromDioError(dioError);
        } else {
          final NetworkExceptions exceptions =
              NetworkExceptions.getDioException(exception);
          throw exceptions;
        }
      },
      test: (exception) {
        return exception is DioException;
      },
    );
  }
}
