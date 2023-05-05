import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';

class CardApp extends StatelessWidget {
  final Widget? child;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const CardApp({
    Key? key,
    this.child,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      color: ColorApp.tertiaryContainer.color,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
