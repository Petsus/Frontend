import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/address/address.dart';
import 'package:petsus/api/model/address/cities.dart';
import 'package:petsus/api/model/address/state.dart';
import 'package:petsus/api/model/clinic/clinic_list.dart';
import 'package:petsus/api/model/clinic/clinics.dart';
import 'package:petsus/implementation/dev/util/list_images.dart';
import 'package:petsus/page/home/towerhall/viewmodel/clinic_list_town_hall_view_model.dart';

@Environment(Environment.dev)
@Injectable(as: ClinicListTownHallViewModel)
class ClinicListTownHallViewModelDev extends ClinicListTownHallViewModel {
  @override
  Future<String> username() async => 'Adashino Benio';

  @override
  Future<ClinicList> clinics(int page, int pageSize, bool orderByName, bool orderByDate, String filter) async {
    if (page == 7) throw UnimplementedError();
    return ClinicList(
      page: page,
      pageCount: 13,
      clinics: List.generate(pageSize, (index) {
        return Clinics(
          id: index,
          name: 'Clinic $index',
          cpf: null,
          cnpj: '25.577.981/0001-65',
          site: 'https://p3re.jp/en/',
          image: imagesSamples[page % imagesSamples.length],
          phone: '(15) 98765-4321',
          address: Address(
            id: index + pageSize,
            lat: -23.5005272,
            lng: -47.3990049,
            number: 1,
            city: Cities(
              id: index + (pageSize * 2),
              name: 'Sorocaba',
              stateId: index + (pageSize * 3),
            ),
            state: States(
              id: index + (pageSize * 3),
              name: 'São Paulo',
              initials: 'SP',
            ),
            address: 'Rod. Raposo Tavares, km 92,5',
            complement: null,
            postalCode: '18023-000',
            neighborhood: 'Vila Artura',
          ),
        );
      })
          .where(
            (element) => element.name.contains(filter)
                || element.cnpj?.contains(filter) == true
                || element.cpf?.contains(filter) == true,
          )
          .toList(),
    );
  }
}
