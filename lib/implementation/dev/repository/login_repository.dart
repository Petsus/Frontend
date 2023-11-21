import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/auth/auth.dart';
import 'package:petsus/api/model/auth/auth_token.dart';
import 'package:petsus/api/service/login_repository.dart';
import 'package:petsus/util/result.dart';

@Environment(Environment.dev)
@Injectable(as: ILoginRepository)
class LoginRepositoryDev extends ILoginRepository {
  @override
  Future<Result<AuthToken>> login(Auth auth) async {
    return Result.success(
      value: AuthToken(
        token: 'token',
        typeToken: 'typeToken',
        validateToken: 0,
      ),
    );
  }
}
