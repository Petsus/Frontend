import 'package:petsus/api/model/clinic/clinic_list.dart';

import 'base_town_hall_viewmodel.dart';

abstract class ClinicListTownHallViewModel extends BaseTownHallViewModel {
  Future<ClinicList> clinics(int page, int pageSize, bool orderByName, bool orderByDate, String filter);
}
