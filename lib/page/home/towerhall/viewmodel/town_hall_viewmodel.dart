
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/page/home/towerhall/viewmodel/base_town_hall_viewmodel.dart';

abstract class ITownHallViewModel extends BaseTownHallViewModel {
  Future<List<Level>> levels();
}