import 'package:dio/dio.dart';

class ApiException extends Error {
  final Response<String> response;

  ApiException({
    required this.response,
  });
}
