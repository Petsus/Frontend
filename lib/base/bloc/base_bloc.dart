import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/base/error/string_formatter.dart';
import 'package:petsus/util/app_global.dart';

part 'base_bloc.g.dart';

class BaseBloc = AbstractBaseBloc with _$BaseBloc;

abstract class AbstractBaseBloc with Store {
  @observable
  StringFormatter? error;

  @action
  void setError(StringFormatter error) {
    status = ResultStatus.error;
    this.error = error;
  }

  @computed
  String get message => error?.messageString ?? '';

  @observable
  ResultStatus status = ResultStatus.none;

  @action
  Future load() async {}

  @action
  void setStatus(ResultStatus status, {dynamic error, bool showError = true}) {
    this.status = status;
    this.error = ErrorStringFormatter(error).messageError;

    if (status == ResultStatus.error && showError) notifyError();
  }

  void notifyError() {
    final context = globalNavigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(error.snackBar);
    }
  }
}

enum ResultStatus {
  none,
  waiting,
  successful,
  error;
}
