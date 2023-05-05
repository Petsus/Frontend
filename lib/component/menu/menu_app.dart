import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';

class MenuApp extends StatefulWidget {
  final List<SideMenuItem> itemsMenu;
  final PageController pageController;
  final NullableIndexedWidgetBuilder itemBuilder;
  final Widget? footer;
  final bool showAlwaysFooter;

  const MenuApp({
    Key? key,
    required this.itemsMenu,
    required this.itemBuilder,
    required this.pageController,
    this.footer,
    this.showAlwaysFooter = false,
  }) : super(key: key);

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  final SideMenuController menuController = SideMenuController();

  @override
  void initState() {
    menuController.addListener((index) {
        widget.pageController.jumpToPage(index);
    });
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
          footer: widget.footer,
          alwaysShowFooter: widget.showAlwaysFooter,
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
            pageSnapping: false,
            controller: widget.pageController,
            itemBuilder: widget.itemBuilder,
          ),
        ),
      ],
    );
  }
}
