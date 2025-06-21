import 'package:dio/dio.dart';
import 'package:fake_store_app/core/api/api_consumer.dart';
import 'package:fake_store_app/core/api/api_interceptors.dart';
import 'package:fake_store_app/core/api/end_point.dart';
import 'package:fake_store_app/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer()
      : dio = Dio(
          BaseOptions(
            baseUrl: EndPoint.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            receiveDataWhenStatusError: true,
            responseType: ResponseType.json,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    dio.interceptors.add(ApiInterceptors());
  }

  @override
  Future<dynamic> get(
    String path, {
          Object? data,

    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(path,
      data: data,
       queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    try {
      final response = await dio.post(path, queryParameters: queryParameters, data: data);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    try {
      final response = await dio.put(path, queryParameters: queryParameters, data: data);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    try {
      final response = await dio.delete(path, queryParameters: queryParameters, data: data);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
