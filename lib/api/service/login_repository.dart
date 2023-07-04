
import 'package:petsus/api/model/user/user.dart';

abstract class ILoginRepository {
  Future<User> login(String? email, String? password);
}