import 'package:fpdart/fpdart.dart';

abstract class LocaleResourcesService {
  Future<Option<String>> getAccessToken();
  Future<void> setAccessToken(String token);
  Future<void> deleteAccessToken();
  Future<void> setUserId(String userId);
  Future<Option<String>> getUserId();
  Future<void> deleteUserId();

  bool getRememberMe();
  Future<void> setRememberMe(bool value);

  /// Clears all data from secure storage. Use with caution.
  Future<void> clearSecureStorage();
  Future<void> deleteAll();
}
