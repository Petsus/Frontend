import 'package:flutter/material.dart';

ImageLoadingBuilder loading() => (BuildContext context, Widget child, ImageChunkEvent? progress) {
      if (progress == null) return child;
      return const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    };

ImageErrorWidgetBuilder error() => (BuildContext context, Object error, StackTrace? stackTrace) {
      return Image.asset(
        'images/icon_animal.png',
        color: Colors.white,
      );
    };
