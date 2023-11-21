
import 'package:petsus/api/model/clinic/clinic_list.dart';
import 'package:petsus/util/result.dart';

abstract class IClinicRepository {
  Future<Result<ClinicList>> clinics(int page, int pageSize, bool orderByName, bool orderByDate, String filter);
}