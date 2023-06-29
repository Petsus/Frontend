import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/model/veterinary/veterinary.dart';

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
        veterinaries = (map['veterinaries'] as List<Map<String, dynamic>>).map((e) => Veterinary.fromJson(e)).toList(),
        super.fromJson();

  @override
  Map<String, dynamic> toJson() => {};
}
