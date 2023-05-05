import 'package:petsus/api/manager/base_model.dart';

class States extends BaseModel {
  int id;
  String name;
  String initials;

  States({
    required this.id,
    required this.name,
    required this.initials,
  }) : super.init();

  States.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        initials = map["initials"],
        super.fromJson(map);

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "initials": initials,
      };
}
