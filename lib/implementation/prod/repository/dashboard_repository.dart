import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/manager/api_url.dart';
import 'package:petsus/api/manager/base/data_response.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/api/service/dashboard_repository.dart';
import 'package:petsus/util/result.dart';

@Environment(Environment.prod)
@Injectable(as: IDashboardRepository)
class DashboardRepository extends IDashboardRepository {
  final Dio api;

  DashboardRepository({
    required this.api,
  });

  @override
  Future<Result<List<News>>> news() async {
    return await runCatchingAsync(() async {
      final response = await api.get<String>(ApiUrl.dashboardNews().path);
      return response.makeList<News>().data;
    });
  }

  @override
  Future<Result<List<News>>> schedule() async {
    return await runCatchingAsync(() async {
      final response = await api.get<String>(ApiUrl.dashboardSchedule().path);
      return response.makeList<News>().data;
    });
  }
}
