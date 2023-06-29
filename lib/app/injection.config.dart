// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:petsus/api/service/login_repository.dart' as _i8;
import 'package:petsus/base/bloc/base_bloc.dart' as _i3;
import 'package:petsus/implementation/dev/repository/login_repository.dart'
    as _i9;
import 'package:petsus/implementation/dev/router/dashboard_router.dart' as _i7;
import 'package:petsus/implementation/dev/router/login_router.dart' as _i11;
import 'package:petsus/implementation/dev/viewmodel/dashboard_town_hall_viewmodel.dart'
    as _i5;
import 'package:petsus/implementation/dev/viewmodel/login_viewmodel.dart'
    as _i13;
import 'package:petsus/implementation/dev/viewmodel/news_viewmodel.dart'
    as _i15;
import 'package:petsus/implementation/dev/viewmodel/town_hall_viewmodel.dart'
    as _i17;
import 'package:petsus/implementation/dev/viewmodel/veterinary_list_town_hall_viewmodel.dart'
    as _i19;
import 'package:petsus/page/home/towerhall/bloc/clinic_list_bloc.dart' as _i23;
import 'package:petsus/page/home/towerhall/bloc/dashboard_bloc.dart' as _i20;
import 'package:petsus/page/home/towerhall/bloc/veterinary_list_bloc.dart'
    as _i22;
import 'package:petsus/page/home/towerhall/router/dashboard_router.dart' as _i6;
import 'package:petsus/page/home/towerhall/viewmodel/dashboard_town_hall_viewmodel.dart'
    as _i4;
import 'package:petsus/page/home/towerhall/viewmodel/town_hall_viewmodel.dart'
    as _i16;
import 'package:petsus/page/home/towerhall/viewmodel/veterinary_town_hall_viewmodel.dart'
    as _i18;
import 'package:petsus/page/login/router/login_router.dart' as _i10;
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart' as _i12;
import 'package:petsus/page/news/bloc/news_bloc.dart' as _i21;
import 'package:petsus/page/news/viewmodel/news_viewmodel.dart' as _i14;

const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.BaseBloc>(() => _i3.BaseBloc());
    gh.factory<_i4.DashboardTownHallViewModel>(
      () => _i5.DashboardTownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i6.IDashboardRouter>(
      () => _i7.DashboardRouter(),
      registerFor: {_dev},
    );
    gh.factory<_i8.ILoginRepository>(
      () => _i9.LoginRepositoryDev(),
      registerFor: {_dev},
    );
    gh.factory<_i10.ILoginRouter>(
      () => _i11.LoginRouterDev(),
      registerFor: {_dev},
    );
    gh.factory<_i12.LoginViewModel>(
      () => _i13.LoginViewModelDev(loginRepository: gh<_i8.ILoginRepository>()),
      registerFor: {_dev},
    );
    gh.factory<_i14.NewsViewModel>(
      () => _i15.NewsViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i16.TownHallViewModel>(
      () => _i17.TownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i18.VeterinaryTownHallViewModel>(
      () => _i19.VeterinaryTownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i20.AbstractDashboardBloc>(() =>
        _i20.DashboardBloc(viewModel: gh<_i4.DashboardTownHallViewModel>()));
    gh.factory<_i21.AbstractNewsBloc>(
        () => _i21.NewsBloc(viewModel: gh<_i14.NewsViewModel>()));
    gh.factory<_i22.AbstractVeterinaryListBloc>(() => _i22.VeterinaryListBloc(
        viewModel: gh<_i18.VeterinaryTownHallViewModel>()));
    gh.factory<_i23.ClinicListBloc>(
        () => _i23.ClinicListBloc(viewModel: gh<_i16.TownHallViewModel>()));
    return this;
  }
}
