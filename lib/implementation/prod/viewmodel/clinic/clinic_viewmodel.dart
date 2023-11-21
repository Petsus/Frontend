import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/page/home/clinic/viewmodel/clinic_viewmodel.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';

@Injectable(as: IClinicViewModel)
class ClinicViewModel extends IClinicViewModel {
  final SharedPreferences preferences;

  ClinicViewModel({
    required this.preferences,
  });

  @override
  Future<List<Level>> levels() async {
    final user = await preferences.get<User>(Keys.user.name);
    return user?.role ?? [];
  }
}
