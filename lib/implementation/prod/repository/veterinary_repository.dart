import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/manager/api_url.dart';
import 'package:petsus/api/manager/base/data_response.dart';
import 'package:petsus/api/model/veterinary/veterinary_list.dart';
import 'package:petsus/api/service/veterinary_repository.dart';
import 'package:petsus/util/result.dart';

@Injectable(as: IVeterinaryRepository)
class VeterinaryRepository extends IVeterinaryRepository {
  final Dio api;

  VeterinaryRepository({
    required this.api,
  });

  @override
  Future<Result<VeterinaryList>> veterinaries(
    int page,
    int pageSize,
    bool orderByName,
    bool orderByDate,
    String filter,
  ) async {
    return runCatchingAsync(() async {
      final response = await api.get<String>(
        ApiUrl.searchVeterinary().path,
        queryParameters: {
          "page": page,
          "pageSize": pageSize,
          "orderByDate": orderByDate,
          "orderByName": orderByName,
          "query": filter,
        },
      );
      return response.make<VeterinaryList>().data;
    });
  }
}
