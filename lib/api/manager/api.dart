import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/auth/auth_token.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';

const String apiNameLogged = 'apiLogged';
const String baseUrl = 'https://api.petsus.app.br';

@module
abstract class API {
  static Dio? _currentBaseDio;
  static Dio? _currentAppDio;

  static Future<String?> _token(SharedPreferences preferences) async {
    final authToken = await preferences.get<AuthToken>(Keys.token.name);
    return authToken?.bearerToken;
  }

  @Singleton()
  Dio base() {
    final current = _currentBaseDio;
    if (current != null) return current;

    _currentBaseDio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {},
      validateStatus: (statusCode) => statusCode != null,
    ))._apply((dio) {
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    });

    return _currentBaseDio!;
  }

  @Singleton()
  @Named(apiNameLogged)
  Dio app(SharedPreferences preferences) {
    final current = _currentAppDio;
    if (current != null) return current;

    _currentAppDio = base()._apply(
      (dio) {
        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              options.headers.addAll({
                'Authorization': await _token(preferences),
              });
              handler.next(options);
            },
            onError: (exception, handler) {
              if (exception.response?.statusCode == 403) {}
              handler.next(exception);
            },
          ),
        );
      },
    );

    return _currentAppDio!;
  }
}

extension DioExtends on Dio {
  Dio _apply(Function(Dio) function) {
    function(this);
    return this;
  }
}
