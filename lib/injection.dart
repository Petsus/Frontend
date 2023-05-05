import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:reflectable/reflectable.dart';
import 'package:petsus/injection.config.dart';

const reflector = Reflector();
final getIt = GetIt.instance;

class Reflector extends Reflectable {
  const Reflector() : super(invokingCapability, newInstanceCapability);
}

@InjectableInit()
void configureInjection(String env) => getIt.init(environment: env);