import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class Http {
  Future<http.Response> getJson(String url) async {
    return await http.get(Uri.parse(url));
  }

  Future<http.Response> postJson(String url, Map<String, dynamic> body) async {
    return await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );
  }

  Future<http.Response> postListJson(String url, List<dynamic> body) async {
    return await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );
  }

  Future<http.Response> putJson(String url, Map<String, dynamic> body) async {
    return await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );
  }

  Future<http.Response> deleteJson(String url, {List<dynamic>? pessoas}) async {
    return await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(pessoas),
    );
  }
}
/* 
class Http {
  final Dio _dio = Dio();

  Future<Response> getJson({required String url}) async {
    return await _dio.get(url);
  }

  Future<Response> postJson(String url, dynamic data) async {
    return await _dio.post(url, data: data.toJson());
  }

  Future<Response> putJson(String url, dynamic data) async {
    return await _dio.put(url, data: data.toJson());
  }

  Future<Response> deleteJson(String url) async {
    return await _dio.delete(url);
  }
}
 */