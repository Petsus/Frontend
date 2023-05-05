import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:petsus/api/manager/base_model.dart';

bool apiIsInitialized = false;

String baseUrl = '';

late Dio _dio;

Dio createDio() => Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {},
      validateStatus: (statusCode) => statusCode != null,
    ))._apply((dio) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) async {},
          onResponse: (response, handler) async {
            handler.next(response);
          },
          onRequest: (options, handler) async {
            handler.next(options);
          },
        ),
      );
      if (kDebugMode) dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    });

abstract class API {
  static Dio get currentDio => _dio;

  static Future loadAPI() async {
    _dio = createDio();
    apiIsInitialized = true;
  }
}

extension DioExtends on Dio {
  Dio _apply(Function(Dio) function) {
    function(this);
    return this;
  }
}

class ValueResponse<T> {
  final bool _isSuccessful;
  final T? _value;

  ValueResponse(this._isSuccessful, this._value);

  T get data => _value!;

  bool get isSuccessful => _isSuccessful;
}

extension ResponseData on Response<String> {
  ValueResponse<T> response<T extends BaseModel>() => ValueResponse<T>(isSuccessful, data != null ? toObject(data!) : null);

  ValueResponse<List<T>> responseList<T extends BaseModel>() => ValueResponse<List<T>>(isSuccessful, data != null ? toListObject(data!) : null);
}

extension StatusCode on Response {
  bool get isSuccessful {
    return statusCode != null && (statusCode ?? -1) >= 200 && (statusCode ?? -1) <= 300;
  }
}
