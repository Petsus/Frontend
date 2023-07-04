
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/page/home/clinic/viewmodel/clinic_viewmodel.dart';

@Environment(Environment.dev)
@Injectable(as: ClinicViewModel)
class ClinicViewModelDev extends ClinicViewModel {
  @override
  Future<List<Level>> levels() async {
    return [
      Level.admClinic,
    ];
  }
}