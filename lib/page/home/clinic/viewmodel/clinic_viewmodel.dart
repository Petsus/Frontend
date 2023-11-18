
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/base/viewmodel/base_viewmodel.dart';

abstract class IClinicViewModel extends BaseViewModel {
  Future<List<Level>> levels();
}