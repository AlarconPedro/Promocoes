import 'package:dio/dio.dart';

class Http {
  final Dio _dio = Dio();

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, dynamic data) async {
    return await _dio.post(url, data: data.toJson());
  }

  Future<Response> put(String url, dynamic data) async {
    return await _dio.put(url, data: data.toJson());
  }

  Future<Response> delete(String url) async {
    return await _dio.delete(url);
  }
}
