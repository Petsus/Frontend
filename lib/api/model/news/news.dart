import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/reflection/reflection.dart';

@reflector
class News extends BaseModel {
  int id;
  String title;
  String image;
  String? url;
  String? date;

  News({
    required this.id,
    required this.title,
    required this.image,
    this.url,
    this.date,
  }) : super.init();

  News.fromJson(super.map)
      : id = map['id'],
        url = map['content'],
        date = map['date'],
        title = map['name'],
        image = map['image'],
        super.fromJson();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is News && id == other.id;
  }

  @override
  Map<String, dynamic> toJson() => {};

  @override
  int get hashCode => Object.hash(id, date, title, image);
}
