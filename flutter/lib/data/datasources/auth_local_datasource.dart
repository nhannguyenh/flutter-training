import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

@LazySingleton(as: IAuthLocalDataSource)
class AuthLocalDataSource implements IAuthLocalDataSource {
  final FlutterSecureStorage storage;
  final String tokenKey = "jwtToken";

  AuthLocalDataSource(this.storage);

  @override
  Future<String?> getToken() async {
    return await storage.read(key: tokenKey);
  }

  @override
  Future<void> saveToken(String token) async {
    await storage.write(key: tokenKey, value: token);
  }

  @override
  Future<void> clearToken() async {
    await storage.delete(key: tokenKey);
  }

}