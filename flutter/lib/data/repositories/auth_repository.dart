import 'package:injectable/injectable.dart';
import 'package:shopping_app/data/datasources/auth_local_datasource.dart';
import 'package:shopping_app/data/datasources/auth_remote_datasource.dart';
import 'package:shopping_app/data/models/user_model.dart';
import 'package:shopping_app/domain/entities/user.dart';
import 'package:shopping_app/domain/repositories/auth_repository_interface.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository{
  final IAuthRemoteDatasource remoteDatasource;
  final IAuthLocalDatasource localDatasource;

  AuthRepository({
    required this.remoteDatasource,
    required this.localDatasource
  });

  @override
  Future<User> login(String username, String password) async {
    UserModel userModel = await remoteDatasource.login(username, password);

    if (userModel.token.isNotEmpty) {
      await localDatasource.saveToken(userModel.token);
    }
    return userModel;
  }

  @override
  Future<void> logout() async {
    await localDatasource.clearToken();
  }

}