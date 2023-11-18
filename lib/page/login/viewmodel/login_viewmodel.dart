import 'package:petsus/base/viewmodel/base_viewmodel.dart';
import 'package:petsus/util/result.dart';

abstract class ILoginViewModel extends BaseViewModel {
  Future<Result<bool>> login(String? email, String? password);
}