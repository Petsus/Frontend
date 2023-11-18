import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/reflection/reflection.dart';

@reflector
class AuthToken extends BaseModel {
  final int validateToken;
  final String typeToken;
  final String token;

  AuthToken({
    required this.token,
    required this.typeToken,
    required this.validateToken
  }) : super.init();

  AuthToken.fromJson(super.map)
      : token = map['token'],
        typeToken = map['type'],
        validateToken = map['dateExpiration'],
        super.fromJson();

  String get bearerToken {
    return '$typeToken $token';
  }

  @override
  Map<String, dynamic> toJson() => {
    'token': token,
    'type': typeToken,
    'dateExpiration': validateToken,
  };
}