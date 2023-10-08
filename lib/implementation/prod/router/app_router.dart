import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/app/injection.dart';
import 'package:petsus/base/router/app_router.dart';
import 'package:petsus/page/login/screen/login_page.dart';

@Injectable(as: IAppRouter)
class AppRouter extends IAppRouter {
  @override
  void logout({required BuildContext context}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => LoginPage(
          router: getIt.get(),
          viewModel: getIt.get(),
        ),
      ),
    );
  }
}
