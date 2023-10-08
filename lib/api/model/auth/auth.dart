
import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/app/injection.dart';

enum Level { adm, user, admClinic, userClinic, admTownHall, veterinary }

@reflector
class Auth extends BaseModel {
  final String? email;
  final String? password;

  Auth({
    this.email,
    this.password
  }) : super.init();

  @override
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password
  };
}