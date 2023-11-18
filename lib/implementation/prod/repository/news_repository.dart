import 'package:dio/dio.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/manager/api_url.dart';
import 'package:petsus/api/manager/base/data_response.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/api/model/news/news_request.dart';
import 'package:petsus/api/service/news_repository.dart';
import 'package:petsus/util/result.dart';

@Environment(Environment.prod)
@Injectable(as: INewsRepository)
class NewsRepository extends INewsRepository {
  final Dio api;

  NewsRepository({
    required this.api,
  });

  @override
  Future<Result<News>> save(NewsRequest request, XFile image) async {
    return runCatchingAsync(() async {
      final response = await api.post<String>(
        ApiUrl.news().path,
        data: FormData.fromMap({
          "file": MultipartFile.fromBytes(
            await image.readAsBytes(),
            filename: image.name,
            contentType: MediaType('image', image.mimeType?.substring(6) ?? "*"),
          ),
          "json": request.toString(),
        }),
      );
      return response.make<News>().data;
    });
  }

  @override
  Future<Result<News>> update(NewsRequest request, int id, XFile? image) {
    return runCatchingAsync(() async {
      final FormData formData;
      if (image != null) {
        formData = FormData.fromMap({
          "file": MultipartFile.fromBytes(
            await image.readAsBytes(),
            filename: image.name,
            contentType: MediaType('image', image.mimeType?.substring(6) ?? "*"),
          ),
          "json": request.toString(),
        });
      } else {
        formData = FormData.fromMap({"json": request.toString()});
      }
      final response = await api.post<String>(
        ApiUrl.news().path,
        data: formData,
      );
      return response.make<News>().data;
    });
  }
}
