import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/app/injection.dart';

@reflector
class AuthToken extends BaseModel {
  final String validateToken;
  final String typeToken;
  final String token;

  AuthToken({
    required this.token,
    required this.typeToken,
    required this.validateToken
  }) : super.init();

  AuthToken.fromJson(super.map)
      : token = map['token'],
        typeToken = map['token'],
        validateToken = map['validateToken'],
        super.fromJson();

  String get bearerToken {
    return '$typeToken $token';
  }

  @override
  Map<String, dynamic> toJson() => {};
}