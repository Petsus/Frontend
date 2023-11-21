import 'package:petsus/api/model/clinic/clinic_list.dart';
import 'package:petsus/util/result.dart';

import 'base_town_hall_viewmodel.dart';

abstract class IClinicListTownHallViewModel extends BaseTownHallViewModel {
  Future<Result<ClinicList>> clinics(int page, int pageSize, bool orderByName, bool orderByDate, String filter);
}
