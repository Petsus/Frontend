import 'dart:convert';

import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/model/auth/auth.dart';
import 'package:petsus/reflection/reflection.dart';
import 'package:reflectable/reflectable.dart';

T toObject<T extends BaseModel>(String data) {
  Map<String, dynamic> json = jsonDecode(data);
  ClassMirror classMirror = reflector.reflectType(T) as ClassMirror;
  return classMirror.newInstance('fromJson', [json]) as T;
}

List<T> toListObject<T extends BaseModel?>(String data) {
  List<dynamic> json = jsonDecode(data);
  json = json.where((element) => element != null).toList();
  return json.map((e) {
    ClassMirror classMirror = reflector.reflectType(T) as ClassMirror;
    return classMirror.newInstance('fromJson', [e]) as T;
  }).toList();
}

