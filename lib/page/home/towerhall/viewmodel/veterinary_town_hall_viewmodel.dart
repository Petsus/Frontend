import 'package:petsus/api/model/veterinary/veterinary_list.dart';
import 'package:petsus/page/home/towerhall/viewmodel/base_town_hall_viewmodel.dart';

abstract class VeterinaryTownHallViewModel extends BaseTownHallViewModel {
  Future<VeterinaryList> veterinary(int page, int pageSize, bool orderByName, bool orderByDate, String filter);
}