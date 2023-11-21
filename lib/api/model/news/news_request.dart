import 'package:petsus/api/manager/base_model.dart';

class NewsRequest extends BaseModel {
  String title;
  String? url;
  String? date;

  NewsRequest({
    required this.title,
    required this.date,
    required this.url,
  }) : super.fromJson({});

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'content': url,
      };
}
