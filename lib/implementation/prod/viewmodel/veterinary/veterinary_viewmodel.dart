import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/api/model/veterinary/veterinary_list.dart';
import 'package:petsus/api/service/veterinary_repository.dart';
import 'package:petsus/page/home/towerhall/viewmodel/veterinary_town_hall_viewmodel.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';
import 'package:petsus/util/result.dart';

@Injectable(as: IVeterinaryTownHallViewModel)
class VeterinaryTownHallViewModel extends IVeterinaryTownHallViewModel {
  final SharedPreferences preferences;
  final IVeterinaryRepository repository;

  VeterinaryTownHallViewModel({
    required this.preferences,
    required this.repository,
  });

  @override
  Future<String> username() async {
    final user = await preferences.get<User>(Keys.user.name);
    return user?.name ?? "";
  }

  @override
  Future<Result<VeterinaryList>> veterinary(
    int page,
    int pageSize,
    bool orderByName,
    bool orderByDate,
    String filter,
  ) => repository.veterinaries(page, pageSize, orderByName, orderByDate, filter);
}
