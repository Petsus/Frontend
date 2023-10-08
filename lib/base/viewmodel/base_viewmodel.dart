
import 'package:petsus/util/result.dart';

abstract class BaseViewModel {
  void notify(Result result) {
    result.fail((error) {

    });
  }
}