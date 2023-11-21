import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/api/service/dashboard_repository.dart';
import 'package:petsus/page/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';
import 'package:petsus/util/result.dart';

@Injectable(as: IDashboardViewModel)
class DashboardViewModel extends IDashboardViewModel {
  final SharedPreferences preferences;
  final IDashboardRepository repository;

  DashboardViewModel({
    required this.repository,
    required this.preferences,
  });

  @override
  Future<Result<List<News>>> news() async => repository.news();

  @override
  Future<Result<List<News>>> schedule() async => repository.schedule();

  @override
  Future<String> username() async {
    final user = await preferences.get<User>(Keys.user.name);
    return user?.name ?? "";
  }
}
