import 'package:injectable/injectable.dart';
import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/model/auth/auth.dart';
import 'package:petsus/api/model/auth/auth_token.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/api/service/login_repository.dart';
import 'package:petsus/api/service/user_repository.dart';
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';
import 'package:petsus/util/result.dart';

@Injectable(as: ILoginViewModel)
class LoginViewModel extends ILoginViewModel {
  final SharedPreferences preferences;
  final IUserRepository userRepository;
  final ILoginRepository loginRepository;

  LoginViewModel({
    required this.preferences,
    required this.userRepository,
    required this.loginRepository,
  });

  @override
  Future<Result<bool>> login(String? email, String? password) async {
    final loginAwait = await loginRepository.login(Auth(email: email, password: password));

    if (loginAwait.isFail) {
      return loginAwait.mapError();
    }

    await _save(Keys.token.name, loginAwait.get);

    final userResult = await _getUser();
    if (userResult.isSuccessful) {
      return userResult.to((data) => Result.success(value: true));
    }

    return userResult.mapError();
  }

  Future<Result<User>> _getUser() async {
    final result = await userRepository.user();
    await result.successAsync((data) async => await _save(Keys.user.name, data));

    return result;
  }

  Future _save(String key, BaseModel value) async {
    await preferences.saveObject(key, value);
  }
}
