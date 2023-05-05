import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:petsus/component/menu/menu_app.dart';
import 'package:petsus/page/home/adm/fragment/city/city_page.dart';

class AdmHomePage extends StatelessWidget {
  final PageController _pageController = PageController();

  final List<SideMenuItem> _itemsMenu = [
    SideMenuItem(
      priority: 0,
      title: 'Cidades',
      icon: const Icon(Icons.location_city),
      onTap: (index, controller) {
        controller.changePage(index);
      },
    ),
    SideMenuItem(
      priority: 1,
      title: 'Clinicas',
      icon: const Icon(Icons.pets),
      onTap: (index, controller) {
        controller.changePage(index);
      },
    ),
    SideMenuItem(
      priority: 2,
      title: 'Grupo de usuários',
      icon: const Icon(Icons.supervised_user_circle_rounded),
      onTap: (index, controller) {
        controller.changePage(index);
      },
    ),
  ];

  AdmHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuApp(
        itemsMenu: _itemsMenu,
        pageController: _pageController,
        itemBuilder: (context, index) {
          if (index == 0) return CityPage();
          return Placeholder();
        },
      ),
    );
  }
}
