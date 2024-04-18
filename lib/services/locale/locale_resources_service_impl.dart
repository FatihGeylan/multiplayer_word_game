import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart' hide Order;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale_resources_service.dart';

@Order(-1)
@LazySingleton(as: LocaleResourcesService)
final class LocaleResourcesServiceImpl implements LocaleResourcesService {
  final SharedPreferences sharedPreferences;
  final FlutterSecureStorage secureStorage;

  const LocaleResourcesServiceImpl({
    required this.secureStorage,
    required this.sharedPreferences,
  });

  @override
  Future<Option<String>> getAccessToken() async {
    final token = await secureStorage.read(key: _Keys.accessToken);

    return optionOf(token);
  }

  @override
  Future<void> setAccessToken(String token) => secureStorage.write(key: _Keys.accessToken, value: token);

  @override
  Future<void> deleteAccessToken() => secureStorage.delete(key: _Keys.accessToken);

  @override
  Future<void> setUserId(String userId) => secureStorage.write(key: _Keys.userId, value: userId);

  @override
  Future<Option<String>> getUserId() async {
    final userId = await secureStorage.read(key: _Keys.userId);

    return optionOf(userId);
  }

  @override
  Future<void> deleteUserId() => secureStorage.delete(key: _Keys.userId);

  @override
  bool getRememberMe() => sharedPreferences.getBool(_Keys.rememberMe) ?? false;

  @override
  Future<void> setRememberMe(bool value) => sharedPreferences.setBool(_Keys.rememberMe, value);

  @override
  Future<void> clearSecureStorage() => secureStorage.deleteAll();

  @override
  Future<void> deleteAll() async {
    secureStorage.deleteAll();
    sharedPreferences.clear();
  }
}

abstract final class _Keys {
  static const String accessToken = "accessToken";
  static const String userId = "userId";
  static const String rememberMe = "rememberMe";
}
