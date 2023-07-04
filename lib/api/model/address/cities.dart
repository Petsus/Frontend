import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/model/address/state.dart';

class Cities extends BaseModel {
  int id;
  String name;
  int stateId;

  Cities({
    required this.id,
    required this.name,
    required this.stateId,
  }) : super.init();

  Cities.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        stateId = map["stateId"],
        super.fromJson(map);

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stateId": stateId,
      };
}
