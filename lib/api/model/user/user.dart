
import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/injection.dart';

enum Level {
  adm, user, clinic
}

@reflector
class User extends BaseModel {
  final Level role;

  User.fromJson(super.map) :
        role = Level.values.byName((map["role"] as String).toLowerCase()),
        super.fromJson();

  @override
  Map<String, dynamic> toJson() => {};
}