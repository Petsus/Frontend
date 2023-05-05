
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:petsus/injection.dart';
import 'package:reflectable/reflectable.dart';

abstract class BaseModel {
  BaseModel.fromJson(Map<String, dynamic> map);

  @protected
  BaseModel.init();

  Map<String, dynamic> toJson();

  @override
  String toString() => jsonEncode(toJson());
}

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
