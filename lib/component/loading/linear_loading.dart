
import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';

class LinearLoading extends StatelessWidget {
  const LinearLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: LinearProgressIndicator(
        // backgroundColor: ColorApp.primaryColorDark.color,
        // valueColor: AlwaysStoppedAnimation<Color>(ColorApp.primaryColor.color),
      ),
    );
  }
}
