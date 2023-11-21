
import 'package:petsus/api/model/auth/auth.dart';
import 'package:petsus/api/model/auth/auth_token.dart';
import 'package:petsus/util/result.dart';

abstract class ILoginRepository {
  Future<Result<AuthToken>> login(Auth auth);
}