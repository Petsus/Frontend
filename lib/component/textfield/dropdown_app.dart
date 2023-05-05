import 'package:flutter/material.dart';

class DropdownApp extends StatelessWidget {
  final String? hintText;
  final List<String> items;
  final EdgeInsets margin;

  const DropdownApp({
    Key? key,
    required this.items,
    this.hintText,
    this.margin = EdgeInsets.zero
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: DropdownButtonFormField<String>(
        onChanged: (value) {},
        items: items.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: const InputDecoration()
          .applyDefaults(Theme.of(context).inputDecorationTheme)
          .copyWith(hintText: hintText, labelText: hintText),
      ),
    );
  }
}
