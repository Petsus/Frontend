// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isHyperLink;

  const InfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.isHyperLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: DimenApp.marginSmall.size),
          !isHyperLink
              ? Text(subtitle, style: Theme.of(context).textTheme.bodySmall)
              : RichText(
                  text: TextSpan(
                    text: subtitle,
                    recognizer: TapGestureRecognizer()..onTap = () => window.open(subtitle, 'new tab'),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorApp.tertiary.color),
                  ),
                ),
          SizedBox(height: DimenApp.marginDefault.size),
        ],
      ),
    );
  }
}
