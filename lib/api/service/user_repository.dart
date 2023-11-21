
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/util/result.dart';

abstract class IUserRepository {
  Future<Result<User>> user();
}