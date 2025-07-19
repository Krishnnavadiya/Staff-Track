import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hrms/src/storage/app_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiInterceptors {
  InterceptorsWrapper get interceptorsWrapper {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers['Authorization'] =
            'Bearer ${AppStorage.getToken ?? ''}';
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        return handler.next(e);
      },
    );
  }

  PrettyDioLogger get prettyDioLogger {
    return PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      logPrint: (object) {
        log(object.toString());
      },
      error: true,
      compact: true,
      maxWidth: 100,
    );
  }
}
