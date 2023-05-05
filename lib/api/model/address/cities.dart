import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/model/address/state.dart';

class Cities extends BaseModel {
  int id;
  String name;
  States state;

  Cities({
    required this.id,
    required this.name,
    required this.state,
  }) : super.init();

  Cities.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        state = States.fromJson(map["state"]),
        super.fromJson(map);

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stateId": state.toJson(),
      };
}
