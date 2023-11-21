import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/base/router/app_router.dart';
import 'package:petsus/component/menu/menu_app.dart';
import 'package:petsus/injection/injection.dart';
import 'package:petsus/page/home/towerhall/screen/fragment/clinic_list_fragment_page.dart';
import 'package:petsus/page/dashboard/screen/dashboard_fragment_page.dart';
import 'package:petsus/page/home/towerhall/screen/fragment/statistic_fragment_page.dart';
import 'package:petsus/page/home/towerhall/screen/fragment/user_fragment_page.dart';
import 'package:petsus/page/home/towerhall/screen/fragment/veterinary_list_fragment_page.dart';
import 'package:petsus/page/home/towerhall/viewmodel/town_hall_viewmodel.dart';

//ignore: must_be_immutable
class TownHallPage extends StatelessWidget {
  final ITownHallViewModel viewModel;
  final IAppRouter router;

  final PageController pageController = PageController();

  late List<SideMenuItem> baseOptions = [
    SideMenuItem(priority: 0, title: 'Dashboard', icon: const Icon(Icons.dashboard), onTap: callback()),
    SideMenuItem(priority: 1, title: 'Veterinários', icon: const Icon(Icons.pets), onTap: callback()),
    SideMenuItem(priority: 2, title: 'Clínicas', icon: const Icon(Icons.business), onTap: callback()),
  ];

  late List<SideMenuItem> admOptions = [
    SideMenuItem(priority: 3, title: 'Usuários', icon: const Icon(Icons.person), onTap: callback()),
    SideMenuItem(priority: 4, title: 'Estatísticas', icon: const Icon(Icons.graphic_eq), onTap: callback()),
  ];

  TownHallPage({
    super.key,
    required this.viewModel,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadOptions(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          return MenuApp(
            itemsMenu: snapshot.requireData,
            logout: () => router.logout(context: context),
            itemBuilder: (_, index) {
              switch (index) {
                case 0:
                  return DashboardFragmentPage(bloc: getIt.get(), router: getIt.get());
                case 1:
                  return VeterinaryListFragmentPage(bloc: getIt.get(), router: getIt.get());
                case 2:
                  return ClinicListFragmentPage(bloc: getIt.get(), router: getIt.get());
                case 3:
                  return UserFragmentPage();
                case 4:
                  return const StatisticPage();
                default:
                  return Container();
              }
            },
            pageController: pageController,
          );
        },
      ),
    );
  }

  Future<List<SideMenuItem>> loadOptions() async {
    final levels = await viewModel.levels();
    if (!levels.contains(Level.townhall)) return baseOptions;
    // return baseOptions + admOptions;
    return baseOptions;
  }

  void Function(int, SideMenuController) callback() => (int index, SideMenuController controller) => controller.changePage(index);
}
