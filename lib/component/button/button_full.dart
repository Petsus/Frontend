import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';

class ButtonFull extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const ButtonFull({
    Key? key,
    required this.onPressed,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(title),
      height: 56,
      color: ColorApp.primaryContainer.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
