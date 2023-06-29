
import 'package:image_picker/image_picker.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/api/model/news/news_request.dart';
import 'package:petsus/base/viewmodel/base_viewmodel.dart';

abstract class NewsViewModel extends BaseViewModel {
  Future<News?> save(NewsRequest news, XFile image);
  Future<News?> update(NewsRequest news, int id, XFile? image);
}