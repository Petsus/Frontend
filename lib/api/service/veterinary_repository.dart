
import 'package:petsus/api/model/model.dart';
import 'package:petsus/util/result.dart';

abstract class IVeterinaryRepository {
  Future<Result<VeterinaryList>> veterinaries(int page, int pageSize, bool orderByName, bool orderByDate, String filter);
}