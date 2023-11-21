import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/page/home/towerhall/viewmodel/town_hall_viewmodel.dart';

@Environment(Environment.dev)
@Injectable(as: ITownHallViewModel)
class TownHallViewModelDev extends ITownHallViewModel {
  @override
  Future<List<Level>> levels() async {
    return [
      Level.adm,
    ];
  }

  @override
  Future<String> username() async => 'Adashino Benio';
}
