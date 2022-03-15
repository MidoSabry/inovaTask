import 'dart:async';


import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class NetworkService {
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });


}

class NetworkServiceImpl implements NetworkService {
  NetworkServiceImpl();

  
  final _dio = Dio(BaseOptions(validateStatus: (_) => true));

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
     var response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    
    return response;
  }

  @override
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return response;
  }
}