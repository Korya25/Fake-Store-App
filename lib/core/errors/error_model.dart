import 'package:fake_store_app/core/api/end_point.dart';

class ErrorModel {
  final String message;
  final int? statusCode;

  ErrorModel({
    required this.message,
    this.statusCode,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json[ApiKeys.message] ?? 'Unexpected error occurred',
      statusCode: json[ApiKeys.statusCode] ?? 0,
    );
  }
}
