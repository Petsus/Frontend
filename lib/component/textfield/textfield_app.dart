import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  final EdgeInsets padding;
  final TextEditingController controller;
  final String? hintText;

  const TextFieldApp({
    Key? key,
    this.hintText,
    this.padding = EdgeInsets.zero,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        decoration: const InputDecoration()
            .applyDefaults(Theme.of(context).inputDecorationTheme)
            .copyWith(hintText: hintText, labelText: hintText),
      ),
    );
  }
}
