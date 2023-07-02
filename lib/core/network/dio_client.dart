import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient with DioMixin implements Dio {
  DioClient._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(minutes: 10),
      sendTimeout: const Duration(minutes: 10),
      receiveTimeout: const Duration(minutes: 10),
    );

    this.options = options;
    httpClientAdapter = HttpClientAdapter();

    if (kDebugMode) {
      interceptors.add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          requestHeader: false,
          responseHeader: false));
    }
  }

  static Dio getInstance() => DioClient._();
}
