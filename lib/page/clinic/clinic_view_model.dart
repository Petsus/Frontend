import 'package:petsus/api/model/address/cities.dart';
import 'package:petsus/api/model/address/state.dart';

abstract class AbstractClinicViewModel {
  Future<List<States>> getStates();

  Future<List<Cities>> getCities();

  Future<List<dynamic>> getClinics(int page, int size);
}
