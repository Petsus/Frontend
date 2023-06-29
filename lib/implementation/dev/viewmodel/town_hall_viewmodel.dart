import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/page/home/towerhall/viewmodel/town_hall_viewmodel.dart';

@Environment(Environment.dev)
@Injectable(as: TownHallViewModel)
class TownHallViewModelDev extends TownHallViewModel {
  @override
  Future<List<Level>> levels() async {
    return [
      Level.admTownHall,
    ];
  }

  @override
  Future<String> username() async => 'Adashino Benio';
}
