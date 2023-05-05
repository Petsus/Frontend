import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class MenuItemNavigation extends StatelessWidget {
  final bool isSelected;
  final IconData image;
  final String title;
  final VoidCallback? onClick;

  const MenuItemNavigation({
    Key? key,
    this.onClick,
    required this.image,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.0,
      width: 64.0,
      child: InkWell(
        onTap: onClick,
        customBorder: const CircleBorder(),
        child: Ink(
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                image,
                size: 24.0,
                //color: isSelected ? ColorApp.selectedIconColor.color : ColorApp.iconColor.color,
              ),
              SizedBox(height: DimenApp.padding05.size),
              Visibility(
                child: Text(
                  title.toUpperCase(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                visible: isSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
