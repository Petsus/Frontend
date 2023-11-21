import 'package:flutter/material.dart';
import 'package:petsus/component/menu/menu_app.dart';
import 'package:petsus/injection/injection.dart';
import 'package:petsus/page/dashboard/screen/dashboard_fragment_page.dart';
import 'package:petsus/page/home/clinic/bloc/clinic_bloc.dart';
import 'package:petsus/page/home/clinic/uimodel/clinic_page_uimodel.dart';
import 'package:petsus/page/home/towerhall/screen/fragment/veterinary_list_fragment_page.dart';

class ClinicPage extends StatelessWidget {
  final ClinicPageUIModel uiModel = ClinicPageUIModel();
  final AbstractClinicBloc bloc;

  ClinicPage({
    required this.bloc,
  }) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: uiModel.options(bloc.viewModel),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          return MenuApp(
            itemsMenu: snapshot.requireData,
            logout: () => bloc.logout(context),
            itemBuilder: (_, index) {
              switch (index) {
                case 0:
                  return DashboardFragmentPage(bloc: getIt.get(), router: getIt.get());
                case 1:
                  return VeterinaryListFragmentPage(bloc: getIt.get(), router: getIt.get());
                default:
                  return Container();
              }
            },
            pageController: uiModel.pageController,
          );
        },
      ),
    );
  }
}
