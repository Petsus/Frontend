
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/manager/api.dart';
import 'package:petsus/api/manager/api_url.dart';
import 'package:petsus/api/manager/extensions/response.dart';
import 'package:petsus/api/model/auth/auth.dart';
import 'package:petsus/api/model/auth/auth_token.dart';
import 'package:petsus/api/service/login_repository.dart';
import 'package:petsus/util/result.dart';

@Environment(Environment.prod)
@Injectable(as: ILoginRepository)
class LoginRepository extends ILoginRepository {
  final Dio api;

  LoginRepository({required this.api});

  @override
  Future<Result<AuthToken>> login(Auth auth) async {
    return await runCatchingAsync(() async {
      final response = await api.post<String>(ApiUrl.auth().path, data: auth.toJson());
      return response.response<AuthToken>().data;
    });
  }
}