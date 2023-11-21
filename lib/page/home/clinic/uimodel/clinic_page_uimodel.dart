import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/page/home/clinic/viewmodel/clinic_viewmodel.dart';

class ClinicPageUIModel {
  final PageController pageController = PageController();

  late List<SideMenuItem> baseOptions = [
    SideMenuItem(priority: 0, title: 'Dashboard', icon: const Icon(Icons.dashboard), onTap: callback()),
    SideMenuItem(priority: 1, title: 'Veterinários', icon: const Icon(Icons.local_hospital), onTap: callback()),
    // SideMenuItem(priority: 2, title: 'Animais', icon: const Icon(Icons.pets), onTap: callback()),
  ];

  late List<SideMenuItem> admOptions = [
    SideMenuItem(priority: 3, title: 'Usuários', icon: const Icon(Icons.person), onTap: callback()),
  ];

  void Function(int, SideMenuController) callback() => (int index, SideMenuController controller) => controller.changePage(index);

  Future<List<SideMenuItem>> options(IClinicViewModel viewModel) async {
    final levels = await viewModel.levels();
    if (!levels.contains(Level.adm)) return baseOptions;
    // return baseOptions + admOptions;
    return baseOptions;
  }
}