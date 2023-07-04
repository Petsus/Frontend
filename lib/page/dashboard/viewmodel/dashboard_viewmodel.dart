
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/base/viewmodel/base_viewmodel.dart';

abstract class DashboardViewModel extends BaseViewModel {
  Future<String> username();
  Future<List<News>> news();
  Future<List<News>> schedule();
}