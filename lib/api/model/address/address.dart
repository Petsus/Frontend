import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/model/address/cities.dart';
import 'package:petsus/api/model/address/state.dart';

class Address extends BaseModel {
  int id;
  double lat;
  double lng;
  int number;
  Cities city;
  States state;
  String address;
  String? complement;
  String? postalCode;
  String neighborhood;

  Address({
    required this.id,
    required this.lat,
    required this.lng,
    required this.number,
    required this.city,
    required this.state,
    required this.address,
    required this.complement,
    required this.postalCode,
    required this.neighborhood,
  }) : super.init();

  Address.fromJson(super.map)
      : id = map['id'],
        lat = map['lat'],
        lng = map['lng'],
        number = map['number'],
        city = Cities.fromJson(map['city']),
        state = States.fromJson(map['state']),
        address = map['address'],
        complement = map['complement'],
        postalCode = map['postalCode'],
        neighborhood = map['neighborhood'],
        super.fromJson();

  String get formattedAddress => address + ' - $neighborhood' + ', ${city.name}' + ' - ${state.initials}' + (postalCode == null ? '' : ', $postalCode');

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
