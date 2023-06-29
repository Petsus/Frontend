// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});
  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  final IFrameElement frameElement = IFrameElement();
  final Widget _frameView = HtmlElementView(
    viewType: 'StatisticFrame',
    key: UniqueKey(),
  );

  @override
  void initState() {
    frameElement.src = 'https://p3re.jp/en/';
    frameElement.style.height = '100%';
    frameElement.style.width = '100%';
    frameElement.style.border = 'none';
    // frameElement.style.background = 'white';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('StatisticFrame', (int viewId) => frameElement);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _frameView,
    );
  }
}