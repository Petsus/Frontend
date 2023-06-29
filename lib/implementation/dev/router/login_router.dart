import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/app/injection.dart';
import 'package:petsus/page/home/towerhall/screen/town_hall_page.dart';
import 'package:petsus/page/login/router/login_router.dart';

@Environment(Environment.dev)
@Injectable(as: ILoginRouter)
class LoginRouterDev extends ILoginRouter {
  @override
  void home(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => TownHallPage(viewModel: getIt.get())));
  }

  @override
  void resetPassword(BuildContext context) {
    // TODO: implement resetPassword
  }
}