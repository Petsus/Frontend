import 'package:image_picker/image_picker.dart';
import 'package:petsus/api/model/model.dart';
import 'package:petsus/util/result.dart';

abstract class INewsRepository {
  Future<Result<News>> save(NewsRequest request, XFile image);
  Future<Result<News>> update(NewsRequest request, int id, XFile? image);
}