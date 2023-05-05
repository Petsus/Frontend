import 'package:flutter/material.dart';
import 'package:petsus/component/navigation/menu_navigation.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: DimenApp.marginDefault.size),
        child: Row(
          children: [
            MenuNavigation(),
            // const Expanded(
            //   child: AddressPage(),
            //   flex: 8,
            // )
          ],
        ),
      ),
    );
  }
}
