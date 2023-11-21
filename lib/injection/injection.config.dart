// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:petsus/api/manager/api.dart' as _i57;
import 'package:petsus/api/service/clinic_repository.dart' as _i9;
import 'package:petsus/api/service/dashboard_repository.dart' as _i13;
import 'package:petsus/api/service/login_repository.dart' as _i18;
import 'package:petsus/api/service/news_repository.dart' as _i21;
import 'package:petsus/api/service/user_repository.dart' as _i48;
import 'package:petsus/api/service/veterinary_repository.dart' as _i27;
import 'package:petsus/base/bloc/base_bloc.dart' as _i3;
import 'package:petsus/base/router/app_router.dart' as _i5;
import 'package:petsus/implementation/dev/repository/dashboard_repository.dart'
    as _i14;
import 'package:petsus/implementation/dev/repository/login_repository.dart'
    as _i19;
import 'package:petsus/implementation/dev/repository/shared_preferences.dart'
    as _i35;
import 'package:petsus/implementation/dev/viewmodel/townhall/clinic_list_town_hall_viewmodel.dart'
    as _i8;
import 'package:petsus/implementation/dev/viewmodel/townhall/news_viewmodel.dart'
    as _i24;
import 'package:petsus/implementation/dev/viewmodel/townhall/town_hall_viewmodel.dart'
    as _i26;
import 'package:petsus/implementation/dev/viewmodel/townhall/veterinary_list_town_hall_viewmodel.dart'
    as _i32;
import 'package:petsus/implementation/prod/repository/clinic_repository.dart'
    as _i10;
import 'package:petsus/implementation/prod/repository/dashboard_repository.dart'
    as _i15;
import 'package:petsus/implementation/prod/repository/login_repository.dart'
    as _i20;
import 'package:petsus/implementation/prod/repository/news_repository.dart'
    as _i22;
import 'package:petsus/implementation/prod/repository/shared_preferences.dart'
    as _i34;
import 'package:petsus/implementation/prod/repository/user_repository.dart'
    as _i49;
import 'package:petsus/implementation/prod/repository/veterinary_repository.dart'
    as _i28;
import 'package:petsus/implementation/prod/router/app_router.dart' as _i6;
import 'package:petsus/implementation/prod/router/login/login_router.dart'
    as _i45;
import 'package:petsus/implementation/prod/router/townhall/clinic_router.dart'
    as _i12;
import 'package:petsus/implementation/prod/router/townhall/dashboard_router.dart'
    as _i17;
import 'package:petsus/implementation/prod/router/townhall/veterinary_router.dart'
    as _i30;
import 'package:petsus/implementation/prod/viewmodel/clinic/clinic_list_town_hall_view_model.dart'
    as _i39;
import 'package:petsus/implementation/prod/viewmodel/clinic/clinic_viewmodel.dart'
    as _i41;
import 'package:petsus/implementation/prod/viewmodel/clinic/news_viewmodel.dart'
    as _i46;
import 'package:petsus/implementation/prod/viewmodel/dashboard/dashboard_viewmodel.dart'
    as _i43;
import 'package:petsus/implementation/prod/viewmodel/login/login_viewmodel.dart'
    as _i54;
import 'package:petsus/implementation/prod/viewmodel/townhall/town_hall_viewmodel.dart'
    as _i47;
import 'package:petsus/implementation/prod/viewmodel/veterinary/veterinary_viewmodel.dart'
    as _i50;
import 'package:petsus/page/dashboard/bloc/dashboard_bloc.dart' as _i52;
import 'package:petsus/page/dashboard/router/dashboard_router.dart' as _i16;
import 'package:petsus/page/dashboard/viewmodel/dashboard_viewmodel.dart'
    as _i42;
import 'package:petsus/page/home/clinic/bloc/clinic_bloc.dart' as _i51;
import 'package:petsus/page/home/clinic/viewmodel/clinic_viewmodel.dart'
    as _i40;
import 'package:petsus/page/home/towerhall/bloc/clinic_list_bloc.dart' as _i36;
import 'package:petsus/page/home/towerhall/bloc/veterinary_list_bloc.dart'
    as _i38;
import 'package:petsus/page/home/towerhall/router/clinic_page_router.dart'
    as _i11;
import 'package:petsus/page/home/towerhall/router/veterinary_router.dart'
    as _i29;
import 'package:petsus/page/home/towerhall/viewmodel/clinic_list_town_hall_view_model.dart'
    as _i7;
import 'package:petsus/page/home/towerhall/viewmodel/town_hall_viewmodel.dart'
    as _i25;
import 'package:petsus/page/home/towerhall/viewmodel/veterinary_town_hall_viewmodel.dart'
    as _i31;
import 'package:petsus/page/login/bloc/login_bloc.dart' as _i55;
import 'package:petsus/page/login/router/login_router.dart' as _i44;
import 'package:petsus/page/login/screen/login_page.dart' as _i56;
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart' as _i53;
import 'package:petsus/page/news/bloc/news_bloc.dart' as _i37;
import 'package:petsus/page/news/viewmodel/news_viewmodel.dart' as _i23;
import 'package:petsus/repository/shared_preferences.dart' as _i33;

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
    gh.singleton<_i4.Dio>(aPI.base());
    gh.factory<_i5.IAppRouter>(() => _i6.AppRouter());
    gh.factory<_i7.IClinicListTownHallViewModel>(
      () => _i8.ClinicListTownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i9.IClinicRepository>(
        () => _i10.ClinicRepository(api: gh<_i4.Dio>()));
    gh.factory<_i11.IClinicRouter>(() => _i12.ClinicRouter());
    gh.factory<_i13.IDashboardRepository>(
      () => _i14.DashboardRepository(),
      registerFor: {_dev},
    );
    gh.factory<_i13.IDashboardRepository>(
      () => _i15.DashboardRepository(api: gh<_i4.Dio>()),
      registerFor: {_prod},
    );
    gh.factory<_i16.IDashboardRouter>(() => _i17.DashboardRouter());
    gh.factory<_i18.ILoginRepository>(
      () => _i19.LoginRepositoryDev(),
      registerFor: {_dev},
    );
    gh.factory<_i18.ILoginRepository>(
      () => _i20.LoginRepository(api: gh<_i4.Dio>()),
      registerFor: {_prod},
    );
    gh.factory<_i21.INewsRepository>(
      () => _i22.NewsRepository(api: gh<_i4.Dio>()),
      registerFor: {_prod},
    );
    gh.factory<_i23.INewsViewModel>(
      () => _i24.NewsViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i25.ITownHallViewModel>(
      () => _i26.TownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i27.IVeterinaryRepository>(
        () => _i28.VeterinaryRepository(api: gh<_i4.Dio>()));
    gh.factory<_i29.IVeterinaryRouter>(() => _i30.VeterinaryRouter());
    gh.factory<_i31.IVeterinaryTownHallViewModel>(
      () => _i32.VeterinaryTownHallViewModelDev(),
      registerFor: {_dev},
    );
    gh.factory<_i33.SharedPreferences>(() => _i34.AppSharedPreferences());
    gh.factory<_i33.SharedPreferences>(
      () => _i35.SharedPreferencesDev(),
      registerFor: {_dev},
    );
    gh.factory<_i36.AbstractClinicListBloc>(() =>
        _i36.ClinicListBloc(viewModel: gh<_i7.IClinicListTownHallViewModel>()));
    gh.factory<_i37.AbstractNewsBloc>(
        () => _i37.NewsBloc(viewModel: gh<_i23.INewsViewModel>()));
    gh.factory<_i38.AbstractVeterinaryListBloc>(() => _i38.VeterinaryListBloc(
        viewModel: gh<_i31.IVeterinaryTownHallViewModel>()));
    gh.singleton<_i4.Dio>(
      aPI.app(gh<_i33.SharedPreferences>()),
      instanceName: 'apiLogged',
    );
    gh.factory<_i7.IClinicListTownHallViewModel>(
        () => _i39.ClinicListTownHallViewModel(
              preferences: gh<_i33.SharedPreferences>(),
              repository: gh<_i9.IClinicRepository>(),
            ));
    gh.factory<_i40.IClinicViewModel>(
        () => _i41.ClinicViewModel(preferences: gh<_i33.SharedPreferences>()));
    gh.factory<_i42.IDashboardViewModel>(() => _i43.DashboardViewModel(
          repository: gh<_i13.IDashboardRepository>(),
          preferences: gh<_i33.SharedPreferences>(),
        ));
    gh.factory<_i44.ILoginRouter>(
        () => _i45.LoginRouter(preferences: gh<_i33.SharedPreferences>()));
    gh.factory<_i23.INewsViewModel>(
      () => _i46.NewsViewModel(
        preferences: gh<_i33.SharedPreferences>(),
        repository: gh<_i21.INewsRepository>(),
      ),
      registerFor: {_prod},
    );
    gh.factory<_i25.ITownHallViewModel>(() =>
        _i47.TownHallViewModel(preferences: gh<_i33.SharedPreferences>()));
    gh.factory<_i48.IUserRepository>(
      () => _i49.UserRepository(api: gh<_i4.Dio>(instanceName: 'apiLogged')),
      registerFor: {_prod},
    );
    gh.factory<_i31.IVeterinaryTownHallViewModel>(
        () => _i50.VeterinaryTownHallViewModel(
              preferences: gh<_i33.SharedPreferences>(),
              repository: gh<_i27.IVeterinaryRepository>(),
            ));
    gh.factory<_i51.AbstractClinicBloc>(() => _i51.ClinicBloc(
          router: gh<_i5.IAppRouter>(),
          viewModel: gh<_i40.IClinicViewModel>(),
        ));
    gh.factory<_i52.AbstractDashboardBloc>(
        () => _i52.DashboardBloc(viewModel: gh<_i42.IDashboardViewModel>()));
    gh.factory<_i53.ILoginViewModel>(() => _i54.LoginViewModel(
          preferences: gh<_i33.SharedPreferences>(),
          userRepository: gh<_i48.IUserRepository>(),
          loginRepository: gh<_i18.ILoginRepository>(),
        ));
    gh.factory<_i55.AbstractLoginBloc>(() => _i55.LoginBloc(
          router: gh<_i44.ILoginRouter>(),
          viewModel: gh<_i53.ILoginViewModel>(),
        ));
    gh.factory<_i56.LoginPage>(
        () => _i56.LoginPage(bloc: gh<_i55.AbstractLoginBloc>()));
    return this;
  }
}

class _$API extends _i57.API {}
