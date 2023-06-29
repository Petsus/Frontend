import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class FilterChipApp extends StatelessWidget {
  final String text;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const FilterChipApp({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: DimenApp.marginSmall.size),
      child: FilterChip(
        label: Text(text),
        selected: selected,
        onSelected: onSelected,
        selectedColor: ColorApp.primary.color,
        checkmarkColor: ColorApp.background.color,
        surfaceTintColor: ColorApp.primary.color,
        backgroundColor: ColorApp.background.color,
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: selected ? ColorApp.background.color : ColorApp.onBackground.color
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorApp.primary.color),
          borderRadius: DimenApp.borderRadius05.radius,
        ),
      ),
    );
  }
}
