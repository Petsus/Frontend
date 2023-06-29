
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Configuration {
  static String get environment => _value('environment');

  static String _value(String key) => _env.env[key] ?? '';

  static Future load() async => await _env.load();
  static final DotEnv _env = DotEnv();
}