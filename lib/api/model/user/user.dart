import 'dart:convert';

import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/app/injection.dart';

enum Level { adm, user, admClinic, userClinic, admTownHall, veterinary }

@reflector
class User extends BaseModel {
  final List<Level> role;

  User({
    required this.role,
  }) : super.init();

  User.fromJson(super.map)
      : role = (jsonDecode(map["role"]) as List<String>).map((e) => Level.values.byName(e.toLowerCase())).toList(),
        super.fromJson();

  @override
  Map<String, dynamic> toJson() => {
        'role': role.map((e) => e.name).toList(),
      };
}
