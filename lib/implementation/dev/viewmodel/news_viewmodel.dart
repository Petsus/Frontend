import 'dart:math';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/api/model/news/news_request.dart';
import 'package:petsus/page/news/viewmodel/news_viewmodel.dart';

@Environment(Environment.dev)
@Injectable(as: NewsViewModel)
class NewsViewModelDev extends NewsViewModel {
  @override
  Future<News?> save(NewsRequest news, XFile image) async {
    await Future.delayed(const Duration(seconds: 7));
    return News(
      id: Random().nextInt(500) + 20,
      title: news.title,
      image: image.path,
      url: news.url,
      date: news.date,
    );
  }

  @override
  Future<News?> update(NewsRequest news, int id, XFile? image) async {
    return News(
      id: id,
      title: news.title,
      image: image?.path ?? 'https://images7.alphacoders.com/121/thumb-1920-1210980.png',
      url: news.url,
      date: news.date,
    );
  }
}
