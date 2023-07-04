import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/base/error/string_formatter.dart';
import 'package:petsus/component/header/header_search.dart';
import 'package:petsus/page/dashboard/bloc/dashboard_bloc.dart';
import 'package:petsus/page/dashboard/router/dashboard_router.dart';
import 'package:petsus/util/components/helper_image.dart';
import 'package:petsus/util/resources/app_color.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class DashboardFragmentPage extends StatefulWidget {
  final AbstractDashboardBloc bloc;
  final IDashboardRouter router;

  const DashboardFragmentPage({super.key, required this.bloc, required this.router});

  @override
  State<DashboardFragmentPage> createState() => _DashboardFragmentPageState();
}

class _DashboardFragmentPageState extends State<DashboardFragmentPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    widget.bloc.load();
    searchController.addListener(() {
      widget.bloc.filter(searchController.text);
    });
    autorun((_) {
      if (widget.bloc.status == ResultStatus.error) ScaffoldMessenger.of(context).showSnackBar(widget.bloc.error.snackBar);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DimenApp.marginDefault.all,
      child: Column(
        children: [
          HeaderSearch(
            searchController: searchController,
            username: widget.bloc.viewModel.username(),
          ),
          SizedBox(height: DimenApp.marginDefault.size),
          Observer(
            builder: (_) {
              return Expanded(
                child: _carousel(
                  title: 'Atualizações',
                  itemCount: widget.bloc.newsFiltered.length + 1,
                  context: context,
                  builder: (context, index) {
                    return index >= widget.bloc.newsFiltered.length
                        ? _cardInsert(() => open())
                        : _cardCarousel(
                            news: widget.bloc.newsFiltered[index],
                            callback: () => open(news: widget.bloc.newsFiltered[index]),
                          );
                  },
                ),
              );
            },
          ),
          SizedBox(height: DimenApp.marginDefault.size),
          Observer(builder: (context) {
            return Expanded(
                child: _carousel(
              title: 'Agenda',
              itemCount: widget.bloc.schedulesFiltered.length + 1,
              context: context,
              builder: (context, index) {
                return index >= widget.bloc.schedulesFiltered.length
                    ? _cardInsert(() => open())
                    : _cardCarousel(
                        news: widget.bloc.schedulesFiltered[index],
                        callback: () => open(news: widget.bloc.schedulesFiltered[index]),
                      );
              },
            ));
          }),
        ],
      ),
    );
  }

  Widget _carousel({
    required String title,
    required int itemCount,
    required BuildContext context,
    required NullableIndexedWidgetBuilder builder,
  }) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(height: DimenApp.marginSmall.size),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: DimenApp.marginDefault.size),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: builder.call(context, index),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _card({
    required Widget child,
    required VoidCallback callback,
  }) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: ColorApp.primary.color, width: 2.0),
            borderRadius: DimenApp.borderRadius.radius,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DimenApp.borderRadius.size),
            child: child,
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(DimenApp.borderRadius.size),
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          child: InkWell(
            splashColor: ColorApp.tertiary.color.withOpacity(0.3),
            onTap: callback,
          ),
        ),
      ],
    );
  }

  Widget _cardInsert(
    VoidCallback callback,
  ) {
    return _card(
      callback: callback,
      child: Center(
        child: Icon(
          Icons.add_circle_outline,
          size: 75,
          color: ColorApp.primary.color,
        ),
      ),
    );
  }

  Widget _cardCarousel({
    required News news,
    required VoidCallback callback,
  }) {
    return _card(
      callback: callback,
      child: Image.network(
        news.image,
        fit: BoxFit.cover,
        loadingBuilder: loading(),
        errorBuilder: error(),
      ),
    );
  }

  void open({News? news}) async {
    final value = await (news == null ? widget.router.create(context) : widget.router.edit(context, news));
    if (value != null) widget.bloc.update(value);
  }
}
