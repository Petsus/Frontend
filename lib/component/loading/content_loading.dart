
import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';

class ContentLoading extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const ContentLoading({Key? key, required this.child, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;
    return Stack(
      children: [
        child,
        Container(
          color: ColorApp.background.color.withAlpha(127),
          height: double.maxFinite,
          width: double.maxFinite,
          child: const CircularProgressIndicator(),
        )
      ],
    );
  }
}
