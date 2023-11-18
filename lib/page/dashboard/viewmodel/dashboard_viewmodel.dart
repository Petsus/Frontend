
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/base/viewmodel/base_viewmodel.dart';
import 'package:petsus/util/result.dart';

abstract class IDashboardViewModel extends BaseViewModel {
  Future<String> username();
  Future<Result<List<News>>> news();
  Future<Result<List<News>>> schedule();
}