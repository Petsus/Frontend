import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/page/login/router/login_router.dart';
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart';

part 'login_bloc.g.dart';

@Injectable(as: AbstractLoginBloc)
class LoginBloc = AbstractLoginBloc with _$LoginBloc;

abstract class AbstractLoginBloc extends BaseBloc with Store {
  final ILoginRouter router;
  final ILoginViewModel viewModel;

  AbstractLoginBloc({
    required this.router,
    required this.viewModel,
  });

  Future login(BuildContext context, String? email, String? password) async {
    final result = await viewModel.login(email, password);
    result.fail((error) => setStatus(ResultStatus.error, error: error));

    if (result.isSuccessful) {
      router.home(context);
    }
  }

  void resetPassword(BuildContext context) => router.resetPassword(context);
}
