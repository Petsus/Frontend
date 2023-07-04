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

  late final _$pageAtom =
      Atom(name: 'AbstractClinicListBloc.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$pageCountAtom =
      Atom(name: 'AbstractClinicListBloc.pageCount', context: context);

  @override
  int get pageCount {
    _$pageCountAtom.reportRead();
    return super.pageCount;
  }

  @override
  set pageCount(int value) {
    _$pageCountAtom.reportWrite(value, super.pageCount, () {
      super.pageCount = value;
    });
  }

  late final _$clinicsAtom =
      Atom(name: 'AbstractClinicListBloc.clinics', context: context);

  @override
  ObservableList<Clinics> get clinics {
    _$clinicsAtom.reportRead();
    return super.clinics;
  }

  @override
  set clinics(ObservableList<Clinics> value) {
    _$clinicsAtom.reportWrite(value, super.clinics, () {
      super.clinics = value;
    });
  }

  late final _$loadPageAsyncAction =
      AsyncAction('AbstractClinicListBloc.loadPage', context: context);

  @override
  Future<dynamic> loadPage(int page) {
    return _$loadPageAsyncAction.run(() => super.loadPage(page));
  }

  late final _$orderByNameAsyncAction =
      AsyncAction('AbstractClinicListBloc.orderByName', context: context);

  @override
  Future<dynamic> orderByName(bool value) {
    return _$orderByNameAsyncAction.run(() => super.orderByName(value));
  }

  late final _$orderByDateAsyncAction =
      AsyncAction('AbstractClinicListBloc.orderByDate', context: context);

  @override
  Future<dynamic> orderByDate(bool value) {
    return _$orderByDateAsyncAction.run(() => super.orderByDate(value));
  }

  late final _$filterAsyncAction =
      AsyncAction('AbstractClinicListBloc.filter', context: context);

  @override
  Future<dynamic> filter(String filter) {
    return _$filterAsyncAction.run(() => super.filter(filter));
  }

  @override
  String toString() {
    return '''
orderBy: ${orderBy},
page: ${page},
pageCount: ${pageCount},
clinics: ${clinics},
isOrderByName: ${isOrderByName},
isOrderByDate: ${isOrderByDate}
    ''';
  }
}
