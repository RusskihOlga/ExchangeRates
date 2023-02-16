import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Map<String, dynamic> _parseData(String response) {
  return jsonDecode(response) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> parseJson(String text) {
  return compute(_parseData, text);
}

class Client {
  final String _baseUrl = "https://www.cbr-xml-daily.ru/";
  late final Dio _dio;

  Client() {
    _dio = Dio();
    _dio.options.baseUrl = _baseUrl;
    _dio.transformer = DefaultTransformer()..jsonDecodeCallback = parseJson;
    _dio.options.headers['content-Type'] = 'application/json';
  }

  dynamic getData(String path) async {
    var response = await _dio.get(path);
    return response.data;
  }

  dynamic postData(String path, {Map<String, dynamic>? data}) async {
    var response = await _dio.post(path, data: jsonEncode(data));
    return response.data;
  }
}
