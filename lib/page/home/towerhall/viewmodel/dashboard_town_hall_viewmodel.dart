
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/page/home/towerhall/viewmodel/base_town_hall_viewmodel.dart';

abstract class DashboardTownHallViewModel extends BaseTownHallViewModel {
  Future<List<News>> news();
  Future<List<News>> schedule();
}