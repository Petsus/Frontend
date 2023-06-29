
import 'package:flutter/material.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class ClinicCard extends StatelessWidget {
  const ClinicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: DimenApp.paddingDefault.size),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              radius: 20,
              child: ClipOval(child: Image.asset('images/icon.png')),
            ),
          ),
          SizedBox(width: DimenApp.paddingDefault.size),
          Text('Name clinic')
        ],
      ),
    );
  }
}
