// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseBloc on AbstractBaseBloc, Store {
  Computed<String>? _$messageComputed;

  @override
  String get message =>
      (_$messageComputed ??= Computed<String>(() => super.message,
              name: 'AbstractBaseBloc.message'))
          .value;

  late final _$errorAtom =
      Atom(name: 'AbstractBaseBloc.error', context: context);

  @override
  StringFormatter? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(StringFormatter? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'AbstractBaseBloc.status', context: context);

  @override
  ResultStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ResultStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('AbstractBaseBloc.load', context: context);

  @override
  Future<dynamic> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$AbstractBaseBlocActionController =
      ActionController(name: 'AbstractBaseBloc', context: context);

  @override
  void setError(StringFormatter error) {
    final _$actionInfo = _$AbstractBaseBlocActionController.startAction(
        name: 'AbstractBaseBloc.setError');
    try {
      return super.setError(error);
    } finally {
      _$AbstractBaseBlocActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(ResultStatus status, {dynamic error}) {
    final _$actionInfo = _$AbstractBaseBlocActionController.startAction(
        name: 'AbstractBaseBloc.setStatus');
    try {
      return super.setStatus(status, error: error);
    } finally {
      _$AbstractBaseBlocActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
status: ${status},
message: ${message}
    ''';
  }
}
