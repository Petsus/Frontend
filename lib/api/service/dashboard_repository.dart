import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/util/result.dart';

abstract class IDashboardRepository {
  Future<Result<List<News>>> news();

  Future<Result<List<News>>> schedule();
}
