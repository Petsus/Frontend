// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:petsus/api/manager/api.dart' as _i40;
import 'package:petsus/api/service/login_repository.dart' as _i17;
import 'package:petsus/api/service/user_repository.dart' as _i36;
import 'package:petsus/base/bloc/base_bloc.dart' as _i3;
import 'package:petsus/base/router/app_router.dart' as _i11;
import 'package:petsus/implementation/dev/repository/login_repository.dart'
    as _i18;
import 'package:petsus/implementation/dev/repository/shared_preferences.dart'
    as _i25;
import 'package:petsus/implementation/dev/router/app_router.dart' as _i12;
import 'package:petsus/implementation/dev/router/login/login_router.dart'
    as _i35;
import 'package:petsus/implementation/dev/router/townhall/clinic_router.dart'
    as _i14;
import 'package:petsus/implementation/dev/router/townhall/dashboard_router.dart'
    as _i16;
import 'package:petsus/implementation/dev/router/townhall/veterinary_router.dart'
    as _i21;
import 'package:petsus/implementation/dev/viewmodel/city/clinic_viewmodel.dart'
    as _i7;
import 'package:petsus/implementation/dev/viewmodel/townhall/clinic_list_town_hall_viewmodel.dart'
    as _i5;
import 'package:petsus/implementation/dev/viewmodel/townhall/dashboard_town_hall_viewmodel.dart'
    as _i9;
import 'package:petsus/implementation/dev/viewmodel/townhall/news_viewmodel.dart'
    as _i23;
import 'package:petsus/implementation/dev/viewmodel/townhall/town_hall_viewmodel.dart'
    as _i27;
import 'package:petsus/implementation/dev/viewmodel/townhall/veterinary_list_town_hall_viewmodel.dart'
    as _i29;
import 'package:petsus/implementation/prod/repository/login_repository.dart'
    as _i19;
import 'package:petsus/implementation/prod/repository/user_repository.dart'
    as _i37;
import 'package:petsus/implementation/prod/viewmodel/login/login_viewmodel.dart'
    as _i39;
import 'package:petsus/page/dashboard/bloc/dashboard_bloc.dart' as _i31;
import 'package:petsus/page/dashboard/router/dashboard_router.dart' as _i15;
import 'package:petsus/page/dashboard/viewmodel/dashboard_viewmodel.dart'
    as _i8;
import 'package:petsus/page/home/clinic/viewmodel/clinic_viewmodel.dart' as _i6;
import 'package:petsus/page/home/towerhall/bloc/clinic_list_bloc.dart' as _i30;
import 'package:petsus/page/home/towerhall/bloc/veterinary_list_bloc.dart'
    as _i33;
import 'package:petsus/page/home/towerhall/router/clinic_page_router.dart'
    as _i13;
import 'package:petsus/page/home/towerhall/router/veterinary_router.dart'
    as _i20;
import 'package:petsus/page/home/towerhall/viewmodel/clinic_list_town_hall_view_model.dart'
    as _i4;
import 'package:petsus/page/home/towerhall/viewmodel/town_hall_viewmodel.dart'
    as _i26;
import 'package:petsus/page/home/towerhall/viewmodel/veterinary_town_hall_viewmodel.dart'
    as _i28;
import 'package:petsus/page/login/router/login_router.dart' as _i34;
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart' as _i38;
import 'package:petsus/page/news/bloc/news_bloc.dart' as _i32;
import 'package:petsus/page/news/viewmodel/news_viewmodel.dart' as _i22;
import 'package:petsus/repository/shared_preferences.dart' as _i24;

const String _dev = 'dev';
const String _prod = 'prod';

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
    final aPI = _$API();
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
    gh.singleton<_i10.Dio>(aPI.base());
    gh.factory<_i11.IAppRouter>(
      () => _i12.AppRouterDev(),
      registerFor: {_dev},
    );
    gh.factory<_i13.IClinicRouter>(
      () => _i14.ClinicRouter(),
      registerFor: {_dev},
    );
    gh.factory<_i15.IDashboardRouter>(
      () => _i16.DashboardRouter(),
      registerFor: {_dev},
    );
    gh.factory<_i17.ILoginRepository>(
      () => _i18.LoginRepositoryDev(),
      registerFor: {_dev},
    );
    gh.factory<_i17.ILoginRepository>(
      () => _i19.LoginRepository(api: gh<_i10.Dio>()),
      registerFor: {_prod},
    );
    gh.factory<_i20.IVeterinaryRouter>(
      () => _i21.VeterinaryRouter(),
      registerFor: {_dev},
    );
    gh.factory<_i22.NewsViewModel>(
      () => _i23.NewsViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i24.SharedPreferences>(
      () => _i25.SharedPreferencesDev(),
      registerFor: {_dev},
    );
    gh.factory<_i26.TownHallViewModel>(
      () => _i27.TownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i28.VeterinaryTownHallViewModel>(
      () => _i29.VeterinaryTownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i30.AbstractClinicListBloc>(() =>
        _i30.ClinicListBloc(viewModel: gh<_i4.ClinicListTownHallViewModel>()));
    gh.factory<_i31.AbstractDashboardBloc>(
        () => _i31.DashboardBloc(viewModel: gh<_i8.DashboardViewModel>()));
    gh.factory<_i32.AbstractNewsBloc>(
        () => _i32.NewsBloc(viewModel: gh<_i22.NewsViewModel>()));
    gh.factory<_i33.AbstractVeterinaryListBloc>(() => _i33.VeterinaryListBloc(
        viewModel: gh<_i28.VeterinaryTownHallViewModel>()));
    gh.singleton<_i10.Dio>(
      aPI.app(gh<_i24.SharedPreferences>()),
      instanceName: 'apiLogged',
    );
    gh.factory<_i34.ILoginRouter>(
      () => _i35.LoginRouterDev(preferences: gh<_i24.SharedPreferences>()),
      registerFor: {_dev},
    );
    gh.factory<_i36.IUserRepository>(
      () => _i37.UserRepository(api: gh<_i10.Dio>(instanceName: 'apiLogged')),
      registerFor: {_prod},
    );
    gh.factory<_i38.ILoginViewModel>(() => _i39.LoginViewModel(
          preferences: gh<_i24.SharedPreferences>(),
          userRepository: gh<_i36.IUserRepository>(),
          loginRepository: gh<_i17.ILoginRepository>(),
        ));
    return this;
  }
}

class _$API extends _i40.API {}
