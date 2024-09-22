import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sera_test/src/util/global_variable.dart';

abstract final class KeyFlutterSecureStorage {
  static const String keyToken = 'token';
  static const String keyUserId = 'user_id';
}

abstract final class SecureStorageHelper {
  static final _fss = locator<FlutterSecureStorage>();

  static Future<String?> getToken() =>
      _fss.read(key: KeyFlutterSecureStorage.keyToken);
  static Future<void> saveToken(String? token) =>
      _fss.write(key: KeyFlutterSecureStorage.keyToken, value: token);
  static Future<void> removeToken() =>
      _fss.delete(key: KeyFlutterSecureStorage.keyToken);

  static Future<String?> getUserId() =>
      _fss.read(key: KeyFlutterSecureStorage.keyUserId);
  static Future<void> saveUserId(String? token) =>
      _fss.write(key: KeyFlutterSecureStorage.keyUserId, value: token);
  static Future<void> removeUserId() =>
      _fss.delete(key: KeyFlutterSecureStorage.keyUserId);

  static Future<void> logout() async {
    await SecureStorageHelper.removeToken();
    await SecureStorageHelper.removeUserId();
  }
}
