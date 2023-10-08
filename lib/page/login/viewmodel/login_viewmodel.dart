import 'package:petsus/base/viewmodel/base_viewmodel.dart';

abstract class ILoginViewModel extends BaseViewModel {
  Future<bool> login(String? email, String? password);
}