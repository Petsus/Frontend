import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/clinic/clinic_list.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/api/service/clinic_repository.dart';
import 'package:petsus/page/home/towerhall/viewmodel/clinic_list_town_hall_view_model.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';
import 'package:petsus/util/result.dart';

@Injectable(as: IClinicListTownHallViewModel)
class ClinicListTownHallViewModel extends IClinicListTownHallViewModel {
  final SharedPreferences preferences;
  final IClinicRepository repository;

  ClinicListTownHallViewModel({
    required this.preferences,
    required this.repository,
  });

  @override
  Future<Result<ClinicList>> clinics(
    int page,
    int pageSize,
    bool orderByName,
    bool orderByDate,
    String filter,
  ) => repository.clinics(page, pageSize, orderByName, orderByDate, filter);

  @override
  Future<String> username() async {
    final user = await preferences.get<User>(Keys.user.name);
    return user?.name ?? "";
  }
}
