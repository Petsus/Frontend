
import 'package:injectable/injectable.dart';
import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/repository/shared_preferences.dart';

@Environment(Environment.dev)
@Injectable(as: SharedPreferences)
class SharedPreferencesDev extends SharedPreferences {
  static final Map<String, BaseModel?> _values = {};

  @override
  Future<T?> get<T extends BaseModel>(String key) async => _values[key] as T?;

  @override
  Future saveObject(String key, BaseModel? value) async => _values[key] = value;
}