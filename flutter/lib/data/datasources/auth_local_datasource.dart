import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthLocalDatasource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
}

@LazySingleton(as: IAuthLocalDatasource)
class AuthLocalDatasource implements IAuthLocalDatasource {
  final FlutterSecureStorage storage;
  final String tokenKey = "jwtToken";

  AuthLocalDatasource(this.storage);

  @override
  Future<String?> getToken() async {
    return await storage.read(key: tokenKey);
  }

  @override
  Future<void> saveToken(String token) async {
    await storage.write(key: tokenKey, value: token);
  }

}