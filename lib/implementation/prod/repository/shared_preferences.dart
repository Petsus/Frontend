import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/manager/base_model.dart';
import 'package:petsus/api/manager/util/convert_object.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/result.dart';

@Injectable(as: SharedPreferences)
class AppSharedPreferences extends SharedPreferences {
  final FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  @override
  Future<T?> get<T extends BaseModel>(String key) async {
    final body = await storage.read(key: key);
    if (body == null) {
      return null;
    }

    return runCatching(() {
      return toObject<T>(body);
    }).data;
  }

  @override
  Future saveObject(String key, BaseModel? value) async {
    await storage.write(key: key, value: value.toString());
  }
}