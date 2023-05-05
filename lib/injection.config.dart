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
import 'package:petsus/api/service/login_repository.dart' as _i3;
import 'package:petsus/implementation/dev/login_repository.dart' as _i4;
import 'package:petsus/page/login/login_viewmodel.dart' as _i5;

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
    gh.factory<_i3.ILoginRepository>(
      () => _i4.LoginRepositoryTest(),
      registerFor: {_dev},
    );
    gh.factory<_i5.LoginViewModel>(
        () => _i5.LoginViewModel(loginRepository: gh<_i3.ILoginRepository>()));
    return this;
  }
}
