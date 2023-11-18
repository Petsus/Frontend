import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/manager/extensions/status_code.dart';
import 'package:petsus/reflection/reflection.dart';
import 'package:reflectable/reflectable.dart';

class DataResponse<T> {
  final bool isSuccessful;
  final T? value;

  DataResponse({
    required this.isSuccessful,
    required this.value,
  });

  T get data => value!;
}

class _Maker {
  static DataResponse<P> make<P extends BaseModel>(Response<String> response) {
    return DataResponse<P>(
        isSuccessful: response.isSuccessful,
        value: response.data != null ? _getObject<P>(response.data!) : null
    );
  }

  static DataResponse<List<P>> makeList<P extends BaseModel>(Response<String> response) {
    return DataResponse<List<P>>(
        isSuccessful: response.isSuccessful,
        value: response.data != null ? _getListObject<P>(response.data!) : null
    );
  }

  static P _getObject<P extends BaseModel>(String data) {
    final Map<String, dynamic> json = jsonDecode(data);
    final valueData = json["data"];

    return _createObject<P>(valueData as Map<String, dynamic>);
  }

  static List<P> _getListObject<P extends BaseModel>(String data) {
    final Map<String, dynamic> json = jsonDecode(data);
    final valueData = json["data"];

    final listElements = valueData.where((element) => element != null).toList() as List<dynamic>;
    return listElements.map<P>((e) => _createObject<P>(e)).toList();
  }

  static T _createObject<T extends BaseModel>(Map<String, dynamic> json) {
    ClassMirror classMirror = reflector.reflectType(T) as ClassMirror;
    return classMirror.newInstance('fromJson', [json]) as T;
  }
}

extension DataResponseMaker on Response<String> {
  DataResponse<P> make<P extends BaseModel>() => _Maker.make<P>(this);
  DataResponse<List<P>> makeList<P extends BaseModel>() => _Maker.makeList<P>(this);
}