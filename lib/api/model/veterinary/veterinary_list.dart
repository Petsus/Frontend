import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/model/veterinary/veterinary.dart';
import 'package:petsus/reflection/reflection.dart';

@reflector
class VeterinaryList extends BaseModel {
  int page;
  int pageCount;
  List<Veterinary> veterinaries;

  VeterinaryList({
    required this.page,
    required this.pageCount,
    required this.veterinaries,
  }) : super.init();

  VeterinaryList.fromJson(super.map)
      : page = map['page'],
        pageCount = map['pageCount'],
        veterinaries = map['veterinaries'].map<Veterinary>((e) => Veterinary.fromJson(e as Map<String, dynamic>)).toList(),
        super.fromJson();

  @override
  Map<String, dynamic> toJson() => {};
}
