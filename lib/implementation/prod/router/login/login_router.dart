import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/app/injection.dart';
import 'package:petsus/page/home/clinic/screen/clinic_page.dart';
import 'package:petsus/page/home/towerhall/screen/town_hall_page.dart';
import 'package:petsus/page/login/router/login_router.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';

@Injectable(as: ILoginRouter)
class LoginRouter extends ILoginRouter {
  final SharedPreferences preferences;

  LoginRouter({required this.preferences});

  @override
  Future home(BuildContext context) async {
    final user = await preferences.get<User>(Keys.user.name);
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) {
          if (user.role.contains(Level.admClinic)) {
            return ClinicPage(viewModel: getIt.get(), router: getIt.get());
          }
          return TownHallPage(viewModel: getIt.get(), router: getIt.get());
        }),
      );
    }
  }

  @override
  void resetPassword(BuildContext context) {
    // TODO: implement resetPassword
  }
}
