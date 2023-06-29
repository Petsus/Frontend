import 'package:mobx/mobx.dart';
import 'package:petsus/base/error/string_formatter.dart';

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
  void setStatus(ResultStatus status, {dynamic error}) {
    this.status = status;
    this.error = (error as Error?).messageError;
  }
}

enum ResultStatus {
  none,
  waiting,
  successful,
  error;
}
