import 'package:petsus/api/manager/base_model.dart';

class Veterinary extends BaseModel {
  int id;
  String crm;
  String name;
  String image;
  List<String> specialities;

  Veterinary({
    required this.id,
    required this.crm,
    required this.name,
    required this.image,
    required this.specialities,
  }) : super.init();

  Veterinary.fromJson(super.map)
      : id = map['id'],
        crm = map['crm'],
        name = map['name'],
        image = map['image'],
        specialities = map['specialities'].map<String>((e) => e as String).toList(),
        super.fromJson();

  @override
  Map<String, dynamic> toJson() => {};
}
