import 'package:dio/dio.dart';
import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleDioException(DioException e) {

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.connectionError:
    case DioExceptionType.cancel:
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel(
        message: e.message ?? 'Connection error',
        statusCode: null,
      ));

    case DioExceptionType.badResponse:
      final data = e.response?.data;
      final statusCode = e.response?.statusCode;
      if (data is Map<String, dynamic>) {
        throw ServerException(errorModel: ErrorModel.fromJson(data));
      } else if (data is String) {
        throw ServerException(errorModel: ErrorModel(
          message: data,
          statusCode: statusCode,
        ));
      } else {
        throw ServerException(errorModel: ErrorModel(
          message: 'Server error (${statusCode ?? 'unknown'})',
          statusCode: statusCode,
        ));
      }
  }
}
