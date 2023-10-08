import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/auth/auth.dart';
import 'package:petsus/api/model/auth/auth_token.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/api/service/login_repository.dart';
import 'package:petsus/api/service/user_repository.dart';
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';

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
  Future<bool> login(String? email, String? password) async {
    final loginAwait = await loginRepository.login(Auth(email: email, password: password));

    if (loginAwait.isFail) {
      notify(loginAwait);
      return false;
    }

    return await _getUser(loginAwait.get);
  }

  Future<bool> _getUser(AuthToken token) async {
    final result = await userRepository.user();

    notify(result);
    result.success((data) async {
      await _save(token, data);
    });

    return result.isSuccessful;
  }

  Future _save(AuthToken token, User user) async {
    await preferences.saveObject(Keys.user.name, user);
    await preferences.saveObject(Keys.token.name, token);
  }
}
