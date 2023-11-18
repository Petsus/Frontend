class ApiUrl {
  final String path;
  final Map<String, dynamic> queryParameters;

  ApiUrl._internal({required this.path, required this.queryParameters});

  factory ApiUrl.auth() => ApiUrl._internal(
        path: '/auth/login',
        queryParameters: {},
      );

  factory ApiUrl.dashboard({
    String path = '',
    Map<String, dynamic> parameters = const {},
  }) =>
      ApiUrl._internal(
        path: '/dashboard' + path,
        queryParameters: parameters,
      );

  factory ApiUrl.news({
    String path = '',
    Map<String, dynamic> parameters = const {},
  }) =>
      ApiUrl._internal(
        path: '/news' + path,
        queryParameters: parameters,
      );

  factory ApiUrl.clinic({
    String path = '',
    Map<String, dynamic> parameters = const {},
  }) =>
      ApiUrl._internal(
        path: '/clinic' + path,
        queryParameters: parameters,
      );

  factory ApiUrl.veterinary({
    String path = '',
    Map<String, dynamic> parameters = const {},
  }) =>
      ApiUrl._internal(
        path: '/veterinary' + path,
        queryParameters: parameters,
      );

  factory ApiUrl.user() => ApiUrl._internal(
        path: '/user',
        queryParameters: {},
      );

  factory ApiUrl.searchClinic() => ApiUrl.clinic(path: '/search');

  factory ApiUrl.searchVeterinary() => ApiUrl.veterinary(path: '/search');

  factory ApiUrl.dashboardNews() => ApiUrl.dashboard(path: '/news');

  factory ApiUrl.dashboardSchedule() => ApiUrl.dashboard(path: '/schedule');
}
