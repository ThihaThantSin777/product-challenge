import 'dart:io';

import 'package:dio/dio.dart';
import 'package:product_app_challenge/utils/strings.dart';

///Error Handling of Interceptors
class ErrorInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionError && err.error is SocketException) {
      return handler.next(DioException(
        requestOptions: err.requestOptions,
        error: kNoInternetConnection,
        type: DioExceptionType.connectionError,
      ));
    }

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      // Optionally, handle the timeout case specifically
      return handler.next(DioException(
        requestOptions: err.requestOptions,
        error: kRequestTimeOut,
        type: DioExceptionType.connectionTimeout,
      ));
    }

    return handler.next(DioException(
      requestOptions: err.requestOptions,
      error: kNotFound,
      type: DioExceptionType.badCertificate,
    ));

    super.onError(err, handler);
  }
}
