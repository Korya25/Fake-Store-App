import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  final String? token;

  ApiInterceptors({this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    });

   
    return handler.next(options); 
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
   
    return handler.next(response); 
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
   

    return handler.next(err); 
  }
}
