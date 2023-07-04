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
import 'package:petsus/api/service/login_repository.dart' as _i16;
import 'package:petsus/base/bloc/base_bloc.dart' as _i3;
import 'package:petsus/base/router/app_router.dart' as _i10;
import 'package:petsus/implementation/dev/repository/login_repository.dart'
    as _i17;
import 'package:petsus/implementation/dev/repository/shared_preferences.dart'
    as _i23;
import 'package:petsus/implementation/dev/router/app_router.dart' as _i11;
import 'package:petsus/implementation/dev/router/login/login_router.dart'
    as _i33;
import 'package:petsus/implementation/dev/router/townhall/clinic_router.dart'
    as _i13;
import 'package:petsus/implementation/dev/router/townhall/dashboard_router.dart'
    as _i15;
import 'package:petsus/implementation/dev/router/townhall/veterinary_router.dart'
    as _i19;
import 'package:petsus/implementation/dev/viewmodel/city/clinic_viewmodel.dart'
    as _i7;
import 'package:petsus/implementation/dev/viewmodel/townhall/clinic_list_town_hall_viewmodel.dart'
    as _i5;
import 'package:petsus/implementation/dev/viewmodel/townhall/dashboard_town_hall_viewmodel.dart'
    as _i9;
import 'package:petsus/implementation/dev/viewmodel/townhall/login_viewmodel.dart'
    as _i35;
import 'package:petsus/implementation/dev/viewmodel/townhall/news_viewmodel.dart'
    as _i21;
import 'package:petsus/implementation/dev/viewmodel/townhall/town_hall_viewmodel.dart'
    as _i25;
import 'package:petsus/implementation/dev/viewmodel/townhall/veterinary_list_town_hall_viewmodel.dart'
    as _i27;
import 'package:petsus/page/dashboard/bloc/dashboard_bloc.dart' as _i29;
import 'package:petsus/page/dashboard/router/dashboard_router.dart' as _i14;
import 'package:petsus/page/dashboard/viewmodel/dashboard_viewmodel.dart'
    as _i8;
import 'package:petsus/page/home/clinic/viewmodel/clinic_viewmodel.dart' as _i6;
import 'package:petsus/page/home/towerhall/bloc/clinic_list_bloc.dart' as _i28;
import 'package:petsus/page/home/towerhall/bloc/veterinary_list_bloc.dart'
    as _i31;
import 'package:petsus/page/home/towerhall/router/clinic_page_router.dart'
    as _i12;
import 'package:petsus/page/home/towerhall/router/veterinary_router.dart'
    as _i18;
import 'package:petsus/page/home/towerhall/viewmodel/clinic_list_town_hall_view_model.dart'
    as _i4;
import 'package:petsus/page/home/towerhall/viewmodel/town_hall_viewmodel.dart'
    as _i24;
import 'package:petsus/page/home/towerhall/viewmodel/veterinary_town_hall_viewmodel.dart'
    as _i26;
import 'package:petsus/page/login/router/login_router.dart' as _i32;
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart' as _i34;
import 'package:petsus/page/news/bloc/news_bloc.dart' as _i30;
import 'package:petsus/page/news/viewmodel/news_viewmodel.dart' as _i20;
import 'package:petsus/repository/shared_preferences.dart' as _i22;

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
    gh.factory<_i4.ClinicListTownHallViewModel>(
      () => _i5.ClinicListTownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i6.ClinicViewModel>(
      () => _i7.ClinicViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i8.DashboardViewModel>(
      () => _i9.DashboardTownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i10.IAppRouter>(
      () => _i11.AppRouterDev(),
      registerFor: {_dev},
    );
    gh.factory<_i12.IClinicRouter>(
      () => _i13.ClinicRouter(),
      registerFor: {_dev},
    );
    gh.factory<_i14.IDashboardRouter>(
      () => _i15.DashboardRouter(),
      registerFor: {_dev},
    );
    gh.factory<_i16.ILoginRepository>(
      () => _i17.LoginRepositoryDev(),
      registerFor: {_dev},
    );
    gh.factory<_i18.IVeterinaryRouter>(
      () => _i19.VeterinaryRouter(),
      registerFor: {_dev},
    );
    gh.factory<_i20.NewsViewModel>(
      () => _i21.NewsViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i22.SharedPreferences>(
      () => _i23.SharedPreferencesDev(),
      registerFor: {_dev},
    );
    gh.factory<_i24.TownHallViewModel>(
      () => _i25.TownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i26.VeterinaryTownHallViewModel>(
      () => _i27.VeterinaryTownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i28.AbstractClinicListBloc>(() =>
        _i28.ClinicListBloc(viewModel: gh<_i4.ClinicListTownHallViewModel>()));
    gh.factory<_i29.AbstractDashboardBloc>(
        () => _i29.DashboardBloc(viewModel: gh<_i8.DashboardViewModel>()));
    gh.factory<_i30.AbstractNewsBloc>(
        () => _i30.NewsBloc(viewModel: gh<_i20.NewsViewModel>()));
    gh.factory<_i31.AbstractVeterinaryListBloc>(() => _i31.VeterinaryListBloc(
        viewModel: gh<_i26.VeterinaryTownHallViewModel>()));
    gh.factory<_i32.ILoginRouter>(
      () => _i33.LoginRouterDev(preferences: gh<_i22.SharedPreferences>()),
      registerFor: {_dev},
    );
    gh.factory<_i34.LoginViewModel>(
      () => _i35.LoginViewModelDev(
        preferences: gh<_i22.SharedPreferences>(),
        loginRepository: gh<_i16.ILoginRepository>(),
      ),
      registerFor: {_dev},
    );
    return this;
  }
}
