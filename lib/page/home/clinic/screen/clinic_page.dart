import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/app/injection.dart';
import 'package:petsus/base/router/app_router.dart';
import 'package:petsus/component/menu/menu_app.dart';
import 'package:petsus/page/dashboard/screen/dashboard_fragment_page.dart';
import 'package:petsus/page/home/clinic/viewmodel/clinic_viewmodel.dart';

//ignore: must_be_immutable
class ClinicPage extends StatelessWidget {
  final ClinicViewModel viewModel;
  final IAppRouter router;
  final PageController pageController = PageController();

  late List<SideMenuItem> baseOptions = [
    SideMenuItem(priority: 0, title: 'Dashboard', icon: const Icon(Icons.dashboard), onTap: callback()),
    SideMenuItem(priority: 1, title: 'Veterinários', icon: const Icon(Icons.local_hospital), onTap: callback()),
    SideMenuItem(priority: 2, title: 'Animais', icon: const Icon(Icons.pets), onTap: callback()),
  ];

  late List<SideMenuItem> admOptions = [
    SideMenuItem(priority: 3, title: 'Usuários', icon: const Icon(Icons.person), onTap: callback()),
    SideMenuItem(priority: 4, title: 'Estatísticas', icon: const Icon(Icons.graphic_eq), onTap: callback()),
  ];

  ClinicPage({
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
    if (!levels.contains(Level.admClinic)) return baseOptions;
    return baseOptions + admOptions;
  }

  void Function(int, SideMenuController) callback() => (int index, SideMenuController controller) => controller.changePage(index);
}
