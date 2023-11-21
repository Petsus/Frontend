import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/base/router/app_router.dart';
import 'package:petsus/page/home/clinic/viewmodel/clinic_viewmodel.dart';

part 'clinic_bloc.g.dart';

@Injectable(as: AbstractClinicBloc)
class ClinicBloc = AbstractClinicBloc with _$ClinicBloc;

abstract class AbstractClinicBloc extends BaseBloc with Store {
  final IClinicViewModel viewModel;
  final IAppRouter router;

  AbstractClinicBloc({
    required this.router,
    required this.viewModel,
  });

  void logout(BuildContext context) => router.logout(context: context);
}
