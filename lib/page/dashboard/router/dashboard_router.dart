
import 'package:flutter/material.dart';
import 'package:petsus/api/model/news/news.dart';

abstract class IDashboardRouter {
  Future<News?> create(BuildContext context);
  Future<News?> edit(BuildContext context, News news);
}