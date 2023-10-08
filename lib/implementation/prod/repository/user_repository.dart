import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/manager/api.dart';
import 'package:petsus/api/manager/api_url.dart';
import 'package:petsus/api/manager/extensions/response.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/api/service/user_repository.dart';
import 'package:petsus/util/result.dart';

@Environment(Environment.prod)
@Injectable(as: IUserRepository)
class UserRepository extends IUserRepository {
  final Dio api;

  UserRepository({
    @Named(apiNameLogged) required this.api,
  });

  @override
  Future<Result<User>> user() async {
    return await runCatchingAsync(() async {
      final response = await api.get<String>(ApiUrl.user().path);
      return response.response<User>().data;
    });
  }
}
