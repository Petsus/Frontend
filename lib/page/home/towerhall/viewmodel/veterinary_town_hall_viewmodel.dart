import 'package:petsus/api/model/veterinary/veterinary_list.dart';
import 'package:petsus/page/home/towerhall/viewmodel/base_town_hall_viewmodel.dart';
import 'package:petsus/util/result.dart';

abstract class IVeterinaryTownHallViewModel extends BaseTownHallViewModel {
  Future<Result<VeterinaryList>> veterinary(int page, int pageSize, bool orderByName, bool orderByDate, String filter);
}