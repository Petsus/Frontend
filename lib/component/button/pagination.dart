import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';
import 'package:petsus/util/resources/dimen_app.dart';

typedef PaginationCallback = void Function(int index);

class Pagination extends StatefulWidget {
  final int itemSelected;
  final int itemCount;
  final PaginationCallback onClick;

  const Pagination({
    super.key,
    required this.itemSelected,
    required this.itemCount,
    required this.onClick,
  });

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  int base = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: MaterialButton(
            highlightColor: ColorApp.tertiary.color.withOpacity(0.3),
            child: Text(
              '«',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorApp.onBackground.color),
            ),
            onPressed: () {
              setState(() {
                if (base > 0) base -= 5;
              });
            },
          ),
        ),
        for (int index = 1; index <= _count(); index++) _button(base + index, base + index == widget.itemSelected),
        SizedBox(
          width: 40,
          height: 40,
          child: MaterialButton(
            highlightColor: ColorApp.tertiary.color.withOpacity(0.3),
            child: Text(
              '»',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorApp.onBackground.color),
            ),
            onPressed: () {
              setState(() {
                if (widget.itemCount > base + 5) base += 5;
              });
            },
          ),
        ),
      ],
    );
  }

  int _count() {
    if (widget.itemCount == 0) return 0;
    if (widget.itemCount % 5 == 0 || widget.itemCount > base + 5) return 5;
    return (widget.itemCount - base) % 5;
  }

  Widget _button(int index, bool isSelected) {
    return Material(
      borderRadius: BorderRadius.circular(DimenApp.borderRadius05.size),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      child: InkWell(
        splashColor: ColorApp.tertiary.color.withOpacity(0.3),
        onTap: () {
          if (index != widget.itemSelected) widget.onClick(index);
        },
        child: Container(
          width: 40,
          height: 40,
          color: isSelected ? ColorApp.tertiary.color : Colors.transparent,
          child: Center(
            child: Text(
              index.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: !isSelected ? ColorApp.onBackground.color : ColorApp.background.color),
            ),
          ),
        ),
      ),
    );
  }
}
