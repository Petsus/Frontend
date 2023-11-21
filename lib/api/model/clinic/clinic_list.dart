import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/model/clinic/clinics.dart';
import 'package:petsus/reflection/reflection.dart';

@reflector
class ClinicList extends BaseModel {
  int page;
  int pageCount;
  List<Clinics> clinics;

  ClinicList({
    required this.page,
    required this.pageCount,
    required this.clinics,
  }) : super.init();

  ClinicList.fromJson(super.map)
      : page = map['page'],
        pageCount = map['pageCount'],
        clinics = map['clinics'].map<Clinics>((e) => Clinics.fromJson(e as Map<String, dynamic>)).toList(),
        super.fromJson();

  @override
  Map<String, dynamic> toJson() => {};
}
