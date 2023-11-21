import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/page/home/towerhall/viewmodel/town_hall_viewmodel.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';

@Injectable(as: ITownHallViewModel)
class TownHallViewModel extends ITownHallViewModel {
  final SharedPreferences preferences;

  TownHallViewModel({
    required this.preferences,
  });

  @override
  Future<List<Level>> levels() async {
    final user = await preferences.get<User>(Keys.user.name);
    return user?.role ?? [];
  }

  @override
  Future<String> username() async {
    final user = await preferences.get<User>(Keys.user.name);
    return user?.name ?? "";
  }
}
