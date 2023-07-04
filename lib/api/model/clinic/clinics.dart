import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/model/address/address.dart';

class Clinics extends BaseModel {
  int id;
  String name;
  String? cpf;
  String? cnpj;
  String? site;
  String image;
  String? phone;
  Address address;

  Clinics({
    required this.id,
    required this.name,
    required this.cpf,
    required this.cnpj,
    required this.site,
    required this.image,
    required this.phone,
    required this.address,
  }) : super.init();

  Clinics.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        cpf = map['cpf'],
        cnpj = map['cnpj'],
        site = map['site'],
        image = map['image'],
        phone = map['phone'],
        address = Address.fromJson(map['address']),
        super.fromJson(map);

  @override
  Map<String, dynamic> toJson() => {};
}
