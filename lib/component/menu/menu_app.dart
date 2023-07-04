import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';

class MenuApp extends StatefulWidget {
  final List<SideMenuItem> itemsMenu;
  final PageController pageController;
  final VoidCallback? logout;
  final NullableIndexedWidgetBuilder itemBuilder;

  const MenuApp({
    Key? key,
    this.logout,
    required this.itemsMenu,
    required this.itemBuilder,
    required this.pageController,
  }) : super(key: key);

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  final SideMenuController menuController = SideMenuController();

  @override
  void initState() {
    menuController.addListener((index) => widget.pageController.jumpToPage(index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SideMenu(
          items: widget.itemsMenu,
          controller: menuController,
          showToggle: true,
          footer: SideMenuItem(
            priority: 10,
            title: 'Logout',
            icon: const Icon(Icons.logout),
            onTap: (index, _) => widget.logout?.call(),
          ),
          alwaysShowFooter: true,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                radius: 20,
                child: ClipOval(child: Image.asset('images/icon.png')),
              ),
            ),
          ),
          displayModeToggleDuration: const Duration(milliseconds: 200),
          style: SideMenuStyle(
            displayMode: SideMenuDisplayMode.compact,
            backgroundColor: ColorApp.surface.color,
            unselectedIconColor: ColorApp.onSurface.color,
            toggleColor: ColorApp.onSurface.color,
            selectedColor: ColorApp.primary.color,
            unselectedTitleTextStyle: TextStyle(color: ColorApp.onSurface.color),
            selectedTitleTextStyle: TextStyle(color: ColorApp.surface.color),
          ),
        ),
        SizedBox(
          width: 1,
          height: double.maxFinite,
          child: Container(color: ColorApp.onSurface.color),
        ),
        Expanded(
          child: PageView.builder(
            pageSnapping: true,
            physics: const NeverScrollableScrollPhysics(),
            controller: widget.pageController,
            itemBuilder: widget.itemBuilder,
          ),
        ),
      ],
    );
  }
}
