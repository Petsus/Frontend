import 'package:injectable/injectable.dart';
import 'package:petsus/api/service/login_repository.dart';

@injectable
class LoginViewModel {
    final ILoginRepository loginRepository;

    @factoryMethod
    LoginViewModel({required this.loginRepository});
}