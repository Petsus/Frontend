import 'package:dio/dio.dart';
import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/manager/extensions/status_code.dart';
import 'package:petsus/api/manager/extensions/value_response.dart';

extension ResponseList on Response<String> {
  ValueResponse<List<T>> responseList<T extends BaseModel>() =>
      ValueResponse<List<T>>(
          isSuccessful, data != null ? toListObject(data!) : null);
}
