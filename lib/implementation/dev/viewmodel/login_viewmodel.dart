
import 'package:injectable/injectable.dart';
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart';

@Environment(Environment.dev)
@Injectable(as: LoginViewModel)
class LoginViewModelDev extends LoginViewModel {
  LoginViewModelDev({required super.loginRepository});

  @override
  Future<bool> login(String? email, String? password) async {
    await loginRepository.login(email, password);
    return true;
  }
}