import 'package:shopping_app/data/datasources/auth_remote_datasource.dart';
import 'package:shopping_app/data/datasources/secure_storage_service.dart';

abstract class IAuthRepository {
  Future<void> login(String email, String password);
}

class AuthRepository implements IAuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final SecureStorageService secureStorageService;

  AuthRepository(this.remoteDatasource, this.secureStorageService);

  @override
  Future<void> login(String email, String password) async {
    final token = await remoteDatasource.login(email: email, password: password);
    await secureStorageService.saveToken(token);
  }

}