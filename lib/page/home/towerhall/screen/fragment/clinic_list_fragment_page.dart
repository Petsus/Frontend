import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:petsus/component/button/pagination.dart';
import 'package:petsus/component/chip/filter_chip.dart';
import 'package:petsus/component/header/header_search.dart';
import 'package:petsus/page/home/towerhall/bloc/clinic_list_bloc.dart';
import 'package:petsus/page/home/towerhall/view/clinic_card.dart';
import 'package:petsus/page/home/towerhall/viewmodel/town_hall_viewmodel.dart';
import 'package:petsus/util/resources/app_color.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class ClinicListFragmentPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final TownHallViewModel viewModel;
  final ClinicListBloc bloc;

  ClinicListFragmentPage({super.key, required this.viewModel}) : bloc = ClinicListBloc(viewModel: viewModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DimenApp.marginDefault.all,
      child: Column(
        children: [
          HeaderSearch(searchController: searchController, username: viewModel.username()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: DimenApp.marginDefault.size),
            child: Text(
              'Clínicas',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Observer(
            builder: (BuildContext context) {
              return Row(
                children: [
                  FilterChipApp(
                    text: 'Data',
                    selected: bloc.isOrderByDate,
                    onSelected: (bool value) {},
                  ),
                  FilterChipApp(
                    text: 'Nome',
                    selected: bloc.isOrderByName,
                    onSelected: (bool value) {},
                  ),
                  const Spacer(),
                  Pagination(
                    itemSelected: bloc.currentPage,
                    itemCount: bloc.pagesCount,
                    onClick: (index) {},
                  ),
                ],
              );
            },
          ),
          SizedBox(height: DimenApp.marginSmall.size),
          Observer(
            builder: (BuildContext context) {
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) => ClinicCard(),
                  separatorBuilder: (_, index) => Container(
                    height: 0.5,
                    width: double.infinity,
                    color: ColorApp.onBackground.color,
                  ),
                  itemCount: 50,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
