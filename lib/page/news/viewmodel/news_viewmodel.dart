
import 'package:image_picker/image_picker.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/api/model/news/news_request.dart';
import 'package:petsus/base/viewmodel/base_viewmodel.dart';
import 'package:petsus/util/result.dart';

abstract class INewsViewModel extends BaseViewModel {
  Future<Result<News>> save(NewsRequest news, XFile image);
  Future<Result<News>> update(NewsRequest news, int id, XFile? image);
  Future<bool> canEdit();
}