// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_list_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClinicListBloc on AbstractClinicListBloc, Store {
  Computed<bool>? _$isOrderByNameComputed;

  @override
  bool get isOrderByName =>
      (_$isOrderByNameComputed ??= Computed<bool>(() => super.isOrderByName,
              name: 'AbstractClinicListBloc.isOrderByName'))
          .value;
  Computed<bool>? _$isOrderByDateComputed;

  @override
  bool get isOrderByDate =>
      (_$isOrderByDateComputed ??= Computed<bool>(() => super.isOrderByDate,
              name: 'AbstractClinicListBloc.isOrderByDate'))
          .value;

  late final _$orderByAtom =
      Atom(name: 'AbstractClinicListBloc.orderBy', context: context);

  @override
  int get orderBy {
    _$orderByAtom.reportRead();
    return super.orderBy;
  }

  @override
  set orderBy(int value) {
    _$orderByAtom.reportWrite(value, super.orderBy, () {
      super.orderBy = value;
    });
  }

  late final _$pagesCountAtom =
      Atom(name: 'AbstractClinicListBloc.pagesCount', context: context);

  @override
  int get pagesCount {
    _$pagesCountAtom.reportRead();
    return super.pagesCount;
  }

  @override
  set pagesCount(int value) {
    _$pagesCountAtom.reportWrite(value, super.pagesCount, () {
      super.pagesCount = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: 'AbstractClinicListBloc.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$clinicsAtom =
      Atom(name: 'AbstractClinicListBloc.clinics', context: context);

  @override
  List<dynamic> get clinics {
    _$clinicsAtom.reportRead();
    return super.clinics;
  }

  @override
  set clinics(List<dynamic> value) {
    _$clinicsAtom.reportWrite(value, super.clinics, () {
      super.clinics = value;
    });
  }

  late final _$orderByNameAsyncAction =
      AsyncAction('AbstractClinicListBloc.orderByName', context: context);

  @override
  Future<dynamic> orderByName() {
    return _$orderByNameAsyncAction.run(() => super.orderByName());
  }

  late final _$orderByDateAsyncAction =
      AsyncAction('AbstractClinicListBloc.orderByDate', context: context);

  @override
  Future<dynamic> orderByDate() {
    return _$orderByDateAsyncAction.run(() => super.orderByDate());
  }

  late final _$toPageAsyncAction =
      AsyncAction('AbstractClinicListBloc.toPage', context: context);

  @override
  Future<dynamic> toPage(int page) {
    return _$toPageAsyncAction.run(() => super.toPage(page));
  }

  late final _$AbstractClinicListBlocActionController =
      ActionController(name: 'AbstractClinicListBloc', context: context);

  @override
  void search(String query) {
    final _$actionInfo = _$AbstractClinicListBlocActionController.startAction(
        name: 'AbstractClinicListBloc.search');
    try {
      return super.search(query);
    } finally {
      _$AbstractClinicListBlocActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderBy: ${orderBy},
pagesCount: ${pagesCount},
currentPage: ${currentPage},
clinics: ${clinics},
isOrderByName: ${isOrderByName},
isOrderByDate: ${isOrderByDate}
    ''';
  }
}
