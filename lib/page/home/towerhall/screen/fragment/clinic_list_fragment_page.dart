import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/base/error/string_formatter.dart';
import 'package:petsus/component/button/pagination.dart';
import 'package:petsus/component/chip/filter_chip.dart';
import 'package:petsus/component/header/header_search.dart';
import 'package:petsus/page/home/towerhall/bloc/clinic_list_bloc.dart';
import 'package:petsus/page/home/towerhall/router/clinic_page_router.dart';
import 'package:petsus/page/home/towerhall/view/clinic_card.dart';
import 'package:petsus/util/resources/app_color.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class ClinicListFragmentPage extends StatefulWidget {
  final AbstractClinicListBloc bloc;
  final IClinicRouter router;

  const ClinicListFragmentPage({
    super.key,
    required this.bloc,
    required this.router,
  });

  @override
  State<ClinicListFragmentPage> createState() => _ClinicListFragmentPageState();
}

class _ClinicListFragmentPageState extends State<ClinicListFragmentPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    widget.bloc.load();
    autorun((p0) {
      if (widget.bloc.status == ResultStatus.error) ScaffoldMessenger.of(context).showSnackBar(widget.bloc.error.snackBar);
    });
    searchController.addListener(() {
      widget.bloc.filter(searchController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DimenApp.marginDefault.all,
      child: Column(
        children: [
          HeaderSearch(searchController: searchController, username: widget.bloc.viewModel.username()),
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
                    selected: widget.bloc.isOrderByDate,
                    onSelected: (bool value) => widget.bloc.orderByDate(value),
                  ),
                  FilterChipApp(
                    text: 'Nome',
                    selected: widget.bloc.isOrderByName,
                    onSelected: (bool value) => widget.bloc.orderByName(value),
                  ),
                  const Spacer(),
                  Pagination(
                    itemSelected: widget.bloc.page,
                    itemCount: widget.bloc.pageCount,
                    onClick: (page) => widget.bloc.loadPage(page),
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
                  itemBuilder: (_, index) => ClinicCard(
                    clinic: widget.bloc.clinics[index],
                    callback: () => widget.router.details(context: context, clinic: widget.bloc.clinics[index]),
                  ),
                  separatorBuilder: (_, index) => Container(
                    height: 0.5,
                    width: double.infinity,
                    color: ColorApp.onBackground.color,
                  ),
                  itemCount: widget.bloc.clinics.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
