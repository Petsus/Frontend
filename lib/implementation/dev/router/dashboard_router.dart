
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/app/injection.dart';
import 'package:petsus/page/home/towerhall/router/dashboard_router.dart';
import 'package:petsus/page/news/screen/news_page.dart';

@Environment(Environment.dev)
@Injectable(as: IDashboardRouter)
class DashboardRouter extends IDashboardRouter {
  @override
  Future<News?> create(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => NewsPage(edit: null, bloc: getIt.get())));
    return result as News?;
  }

  @override
  Future<News?> edit(BuildContext context, News news) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => NewsPage(edit: news, bloc: getIt.get())));
    return result as News?;
  }
}