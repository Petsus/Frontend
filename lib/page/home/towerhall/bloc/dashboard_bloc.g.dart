// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardBloc on AbstractDashboardBloc, Store {
  Computed<List<News>>? _$newsFilteredComputed;

  @override
  List<News> get newsFiltered =>
      (_$newsFilteredComputed ??= Computed<List<News>>(() => super.newsFiltered,
              name: 'AbstractDashboardBloc.newsFiltered'))
          .value;
  Computed<List<News>>? _$schedulesFilteredComputed;

  @override
  List<News> get schedulesFiltered => (_$schedulesFilteredComputed ??=
          Computed<List<News>>(() => super.schedulesFiltered,
              name: 'AbstractDashboardBloc.schedulesFiltered'))
      .value;

  late final _$_newsAtom =
      Atom(name: 'AbstractDashboardBloc._news', context: context);

  @override
  ObservableList<News> get _news {
    _$_newsAtom.reportRead();
    return super._news;
  }

  @override
  set _news(ObservableList<News> value) {
    _$_newsAtom.reportWrite(value, super._news, () {
      super._news = value;
    });
  }

  late final _$_schedulesAtom =
      Atom(name: 'AbstractDashboardBloc._schedules', context: context);

  @override
  ObservableList<News> get _schedules {
    _$_schedulesAtom.reportRead();
    return super._schedules;
  }

  @override
  set _schedules(ObservableList<News> value) {
    _$_schedulesAtom.reportWrite(value, super._schedules, () {
      super._schedules = value;
    });
  }

  late final _$_filterNewsAtom =
      Atom(name: 'AbstractDashboardBloc._filterNews', context: context);

  @override
  String? get _filterNews {
    _$_filterNewsAtom.reportRead();
    return super._filterNews;
  }

  @override
  set _filterNews(String? value) {
    _$_filterNewsAtom.reportWrite(value, super._filterNews, () {
      super._filterNews = value;
    });
  }

  late final _$_filterSchedulesAtom =
      Atom(name: 'AbstractDashboardBloc._filterSchedules', context: context);

  @override
  String? get _filterSchedules {
    _$_filterSchedulesAtom.reportRead();
    return super._filterSchedules;
  }

  @override
  set _filterSchedules(String? value) {
    _$_filterSchedulesAtom.reportWrite(value, super._filterSchedules, () {
      super._filterSchedules = value;
    });
  }

  late final _$AbstractDashboardBlocActionController =
      ActionController(name: 'AbstractDashboardBloc', context: context);

  @override
  void filter(String? query) {
    final _$actionInfo = _$AbstractDashboardBlocActionController.startAction(
        name: 'AbstractDashboardBloc.filter');
    try {
      return super.filter(query);
    } finally {
      _$AbstractDashboardBlocActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(News news) {
    final _$actionInfo = _$AbstractDashboardBlocActionController.startAction(
        name: 'AbstractDashboardBloc.update');
    try {
      return super.update(news);
    } finally {
      _$AbstractDashboardBlocActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newsFiltered: ${newsFiltered},
schedulesFiltered: ${schedulesFiltered}
    ''';
  }
}
