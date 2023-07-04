
import 'package:petsus/page/home/towerhall/viewmodel/base_town_hall_viewmodel.dart';

abstract class VeterinaryTownHallViewModel extends BaseTownHallViewModel {
  Future<dynamic> users(int page, int pageSize, bool orderByName, bool orderByDate, String filter);
}