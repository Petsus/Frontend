
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/api/service/login_repository.dart';

@Environment(Environment.dev)
@Injectable(as: ILoginRepository)
class LoginRepositoryDev extends ILoginRepository {
  @override
  Future<User> login(String? email, String? password) async {
    await Future.delayed(const Duration(seconds: 2));
    List<Level> roles = [Level.admTownHall];

    if (email?.contains('clinic') == true) {
      roles.clear();
      roles.add(Level.admClinic);
    }

    return User(
      role: roles,
    );
  }
}