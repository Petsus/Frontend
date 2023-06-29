// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewsBloc on AbstractNewsBloc, Store {
  late final _$imageSelectedAtom =
      Atom(name: 'AbstractNewsBloc.imageSelected', context: context);

  @override
  XFile? get imageSelected {
    _$imageSelectedAtom.reportRead();
    return super.imageSelected;
  }

  @override
  set imageSelected(XFile? value) {
    _$imageSelectedAtom.reportWrite(value, super.imageSelected, () {
      super.imageSelected = value;
    });
  }

  late final _$AbstractNewsBlocActionController =
      ActionController(name: 'AbstractNewsBloc', context: context);

  @override
  void updateImage(XFile image) {
    final _$actionInfo = _$AbstractNewsBlocActionController.startAction(
        name: 'AbstractNewsBloc.updateImage');
    try {
      return super.updateImage(image);
    } finally {
      _$AbstractNewsBlocActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageSelected: ${imageSelected}
    ''';
  }
}
