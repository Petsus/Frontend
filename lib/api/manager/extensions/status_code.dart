
import 'package:dio/dio.dart';

extension StatusCode on Response {
  bool get isSuccessful {
    return statusCode != null && (statusCode ?? -1) >= 200 && (statusCode ?? -1) <= 300;
  }
}