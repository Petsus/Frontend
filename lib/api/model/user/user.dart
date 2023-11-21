import 'dart:convert';

import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/reflection/reflection.dart';

enum Level {
  adm,
  user,
  clinic,
  townhall,
  veterinary,
}

@reflector
class User extends BaseModel {
  final String name;
  final List<Level> role;

  User({
    required this.name,
    required this.role,
  }) : super.init();

  User.fromJson(super.map)
      : name = map['name'],
        role = map['role'].map<Level>((e) => Level.values.byName(e['name'].toLowerCase())).toList(),
        super.fromJson();

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'role': role.map((e) => {'name': e.name}).toList(),
      };
}
