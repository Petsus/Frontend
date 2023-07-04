

import 'package:petsus/api/manager/base_model.dart';

abstract class SharedPreferences {
  Future saveObject(String key, BaseModel? value);
  Future<T?> get<T extends BaseModel>(String key);
}