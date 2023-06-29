import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/veterinary/veterinary.dart';
import 'package:petsus/api/model/veterinary/veterinary_list.dart';
import 'package:petsus/implementation/dev/util/list_images.dart';
import 'package:petsus/page/home/towerhall/viewmodel/veterinary_town_hall_viewmodel.dart';

@Environment(Environment.dev)
@Injectable(as: VeterinaryTownHallViewModel)
class VeterinaryTownHallViewModelDev extends VeterinaryTownHallViewModel {
  @override
  Future<String> username() async => 'Adashino Benio';

  @override
  Future<VeterinaryList> veterinary(int page, int pageSize, bool orderByName, bool orderByDate, String filter) async {
    if (page == 7) throw UnimplementedError();
    return VeterinaryList(
      page: page,
      pageCount: 13,
      veterinaries: List.generate(pageSize, (index) {
        return Veterinary(
          id: index,
          crm: '$page${pageSize}0-$index',
          name: 'Name veterinary',
          image: imagesSamples[page % imagesSamples.length],
          specialities: ['Cats', 'Dogs'],
        );
      }).where((element) => element.name.contains(filter) || element.crm.contains(filter)).toList(),
    );
  }
}
