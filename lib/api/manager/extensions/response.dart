import 'package:dio/dio.dart';
import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/manager/extensions/status_code.dart';
import 'package:petsus/api/manager/extensions/value_response.dart';

extension ResponseObject on Response<String> {
  ValueResponse<T> response<T extends BaseModel>() =>
      ValueResponse<T>(isSuccessful, data != null ? toObject(data!) : null);
}
