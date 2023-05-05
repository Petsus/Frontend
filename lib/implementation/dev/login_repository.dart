
import 'package:injectable/injectable.dart';
import 'package:petsus/api/service/login_repository.dart';

@Environment(Environment.dev)
@Injectable(as: ILoginRepository)
class LoginRepositoryTest extends ILoginRepository {
  @override
  Future login(String? email, String? password) async {
    await Future.delayed(const Duration(seconds: 5));
  }
}