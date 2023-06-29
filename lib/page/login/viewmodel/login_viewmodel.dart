import 'package:petsus/api/service/login_repository.dart';
import 'package:petsus/base/viewmodel/base_viewmodel.dart';

abstract class LoginViewModel extends BaseViewModel {
  final ILoginRepository loginRepository;

  LoginViewModel({required this.loginRepository});

  Future<bool> login(String? email, String? password);
}