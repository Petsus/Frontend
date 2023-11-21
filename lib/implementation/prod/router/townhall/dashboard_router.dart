import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/component/sheet/side_sheet.dart';
import 'package:petsus/injection/injection.dart';
import 'package:petsus/page/dashboard/router/dashboard_router.dart';
import 'package:petsus/page/news/screen/news_page.dart';

@Injectable(as: IDashboardRouter)
class DashboardRouter extends IDashboardRouter {
  @override
  Future<News?> create(BuildContext context) => _open(context: context);

  @override
  Future<News?> edit(
    BuildContext context,
    News news,
  ) => _open(context: context, news: news);

  Future<News?> _open({
    required BuildContext context,
    News? news,
  }) async {
    final result = await SideSheet.open(
      body: NewsPage(edit: news, bloc: getIt.get()),
      side: Side.right,
      context: context,
      proportional: 2.5,
    );
    return result as News?;
  }
}
