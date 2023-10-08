class ApiUrl {
  final String path;
  final Map<String, dynamic> queryParameters;

  ApiUrl._internal({required this.path, required this.queryParameters});

  factory ApiUrl.auth() => ApiUrl._internal(
        path: '/auth',
        queryParameters: {},
      );

  factory ApiUrl.user() => ApiUrl._internal(
        path: '/user',
        queryParameters: {},
      );
}
