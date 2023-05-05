import 'package:flutter/material.dart';
import 'package:petsus/component/navigation/menu_item_navigation.dart';
import 'package:petsus/util/resources/dimen_app.dart';
import 'package:petsus/util/resources/drawable_app.dart';

class MenuNavigation extends StatelessWidget {
  MenuNavigation({Key? key}) : super(key: key);

  final List<MenuItemNavigation> items = [
    MenuItemNavigation(image: Icons.place, title: 'Teste', isSelected: true, onClick: () {},),
    MenuItemNavigation(image: Icons.account_balance, title: 'Teste', isSelected: false, onClick: () {},),
    MenuItemNavigation(image: Icons.abc, title: 'Teste', isSelected: false, onClick: () {},),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DimenApp.marginDefault.all,
      child: Column(
        children: [
          Image.asset(
            DrawableApp.icon.name,
            width: 64,
            height: 64,
          ),
          SizedBox(height: DimenApp.paddingDefault.size),
          Column(
            children: items.map((e) => Padding(padding: DimenApp.paddingDefault.all, child: e,)).toList(),
          )
        ],
      ),
    );
  }
}
