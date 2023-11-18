import 'package:petsus/api/manager/base_model.dart';

class Cities extends BaseModel {
  int id;
  String name;

  Cities({
    required this.id,
    required this.name,
  }) : super.init();

  Cities.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        super.fromJson(map);

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
