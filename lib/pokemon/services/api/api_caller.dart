import 'dart:convert';

import 'package:dio/dio.dart';

import '../../common/constants.dart';
import 'api_response.dart';

class ApiCaller {
  Dio _fetchData() {
    final options = BaseOptions(baseUrl: BASE_URL);
    return Dio(options);
  }

  Future<ApiResponse<T>> getData<T>() async {
    try {
      final response = await _fetchData().get("");
      final decodedResponse = json.decode(response.data as String);
      final payload = decodedResponse as T;
      return ApiResponse(success: true, payload: payload);
    } catch (error) {
      throw ApiCallException();
    }
  }
}

class ApiCallException implements Exception {
  factory ApiCallException({String message = "Error fetching data"}) {
    return ApiCallException._(message);
  }

  ApiCallException._(this.message);

  late String message;
}
