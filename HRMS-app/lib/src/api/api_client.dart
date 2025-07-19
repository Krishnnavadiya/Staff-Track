import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrms/src/api/api_endpoints.dart';
import 'package:hrms/src/api/api_excetion.dart';
import 'package:hrms/src/api/api_interceptors.dart';
import 'package:hrms/src/utils/utils.dart';

class ApiClient {
  final Dio _dio = Dio();
  final ApiInterceptors _apiInterceptors = ApiInterceptors();

  ApiClient._() {
    init();
  }

  static final ApiClient _instance = ApiClient._();

  factory ApiClient() {
    return _instance;
  }

  void init() {
    _dio.options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      headers: {'Content-Type': 'application/json'},
      validateStatus: (status) {
        if (status == null) return false;
        if (status >= 200 && status < 300) return true;
        if (status == 400 || status == 401 || status == 403) return true;
        return false;
      },
    );
    _dio.interceptors.add(_apiInterceptors.interceptorsWrapper);
    _dio.interceptors.add(_apiInterceptors.prettyDioLogger);
  }

  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    bool isLoading = true,
  }) async {
    Response response;
    try {
      if (isLoading) {
        AppLoading.showLoading();
      }
      response = await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on SocketException {
      throw NetworkException('Internet connection');
    } on DioException catch (e) {
      throw ApiException(e.message ?? 'Please try again');
    } catch (e) {
      throw ApiException('Please try again');
    } finally {
      AppLoading.hideLoading();
    }
    return response.data;
  }

  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool isLoading = true,
  }) async {
    Response response;
    try {
      if (isLoading) {
        AppLoading.showLoading();
      }
      response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on SocketException {
      throw NetworkException('Internet connection');
    } on DioException catch (_) {
      throw ApiException('Please try again');
    } catch (e) {
      throw ApiException('Please try again');
    } finally {
      AppLoading.hideLoading();
    }
    return response.data;
  }

  Future<dynamic> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    bool isLoading = true,
  }) async {
    Response response;
    try {
      if (isLoading) {
        AppLoading.showLoading();
      }
      response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
    } on SocketException {
      throw NetworkException('Internet connection');
    } on DioException catch (e) {
      throw ApiException(e.message ?? 'Please try again');
    } catch (e) {
      throw ApiException('Please try again');
    } finally {
      AppLoading.hideLoading();
    }
    return response.data;
  }

  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    bool isLoading = true,
  }) async {
    Response response;
    try {
      if (isLoading) {
        AppLoading.showLoading();
      }
      response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
    } on SocketException {
      throw NetworkException('Internet connection');
    } on DioException catch (e) {
      throw ApiException(e.message ?? 'Please try again');
    } catch (e) {
      throw ApiException('Please try again');
    } finally {
      AppLoading.hideLoading();
    }
    return response.data;
  }

  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool isLoading = true,
  }) async {
    Response response;
    try {
      if (isLoading) {
        AppLoading.showLoading();
      }
      response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on SocketException {
      throw NetworkException('Internet connection');
    } on DioException catch (e) {
      throw ApiException(e.message ?? 'Please try again');
    } catch (e) {
      throw ApiException('Please try again');
    } finally {
      AppLoading.hideLoading();
    }
    return response.data;
  }
}
