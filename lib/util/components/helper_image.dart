import 'package:flutter/material.dart';

ImageLoadingBuilder loading() => (BuildContext context, Widget child, ImageChunkEvent? progress) {
      if (progress == null) return child;
      return const Column(
        children: [
          Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      );
    };

ImageErrorWidgetBuilder error() => (BuildContext context, Object error, StackTrace? stackTrace) {
      return Image.asset(
        'images/icon_animal.png',
        color: Colors.white,
      );
    };
