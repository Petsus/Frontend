import 'package:injectable/injectable.dart';
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';

@Environment(Environment.dev)
@Injectable(as: LoginViewModel)
class LoginViewModelDev extends LoginViewModel {
  final SharedPreferences preferences;

  LoginViewModelDev({
    required this.preferences,
    required super.loginRepository,
  });

  @override
  Future<bool> login(String? email, String? password) async {
    final user = await loginRepository.login(email, password);
    await preferences.saveObject(Keys.user.name, user);
    return true;
  }
}
