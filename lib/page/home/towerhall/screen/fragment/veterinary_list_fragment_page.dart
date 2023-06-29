import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/base/error/string_formatter.dart';
import 'package:petsus/component/button/pagination.dart';
import 'package:petsus/component/chip/filter_chip.dart';
import 'package:petsus/component/header/header_search.dart';
import 'package:petsus/component/sheet/side_sheet.dart';
import 'package:petsus/page/home/towerhall/bloc/veterinary_list_bloc.dart';
import 'package:petsus/page/home/towerhall/view/veterinary_card.dart';
import 'package:petsus/page/veterinary/veterinary_details.dart';
import 'package:petsus/util/resources/app_color.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class VeterinaryListFragmentPage extends StatefulWidget {
  final AbstractVeterinaryListBloc bloc;

  const VeterinaryListFragmentPage({super.key, required this.bloc});

  @override
  State<VeterinaryListFragmentPage> createState() => _VeterinaryListFragmentPageState();
}

class _VeterinaryListFragmentPageState extends State<VeterinaryListFragmentPage> {
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
              'Veterinários',
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
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              }),
              child: Observer(builder: (context) {
                return ListView.separated(
                  itemBuilder: (_, index) => VeterinaryCard(
                    veterinary: widget.bloc.veterinaries[index],
                    callback: () async {
                      SideSheet.open(
                        body: VeterinaryDetails(veterinary: widget.bloc.veterinaries[index]),
                        side: Side.right,
                        context: context,
                        proportional: 2.5,
                      );
                    },
                  ),
                  separatorBuilder: (_, index) => Container(
                    height: 0.5,
                    width: double.infinity,
                    color: ColorApp.onBackground.color,
                  ),
                  itemCount: widget.bloc.veterinaries.length,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
