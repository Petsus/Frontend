import 'dart:math';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/api/model/news/news_request.dart';
import 'package:petsus/page/news/viewmodel/news_viewmodel.dart';
import 'package:petsus/util/result.dart';

@Environment(Environment.dev)
@Injectable(as: INewsViewModel)
class NewsViewModelDev extends INewsViewModel {
  @override
  Future<Result<News>> save(NewsRequest news, XFile image) async {
    throw UnimplementedError("");
  }

  @override
  Future<Result<News>> update(NewsRequest news, int id, XFile? image) async {
    // return News(
    //   id: id,
    //   title: news.title,
    //   image: image?.path ?? 'https://images7.alphacoders.com/121/thumb-1920-1210980.png',
    //   url: news.url,
    //   date: news.date,
    // );
    throw UnimplementedError("");
  }

  @override
  Future<bool> canEdit() {
    // TODO: implement canEdit
    throw UnimplementedError();
  }
}
