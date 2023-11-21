import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/manager/api_url.dart';
import 'package:petsus/api/manager/base/data_response.dart';
import 'package:petsus/api/model/clinic/clinic_list.dart';
import 'package:petsus/api/service/clinic_repository.dart';
import 'package:petsus/util/result.dart';

@Injectable(as: IClinicRepository)
class ClinicRepository extends IClinicRepository {
  final Dio api;

  ClinicRepository({
    required this.api,
  });

  @override
  Future<Result<ClinicList>> clinics(
    int page,
    int pageSize,
    bool orderByName,
    bool orderByDate,
    String filter,
  ) async {
    return runCatchingAsync(() async {
      final response = await api.get<String>(
        ApiUrl.searchClinic().path,
        queryParameters: {
          "page": page,
          "pageSize": pageSize,
          "orderByDate": orderByDate,
          "orderByName": orderByName,
          "query": filter,
        },
      );
      return response.make<ClinicList>().data;
    });
  }
}
