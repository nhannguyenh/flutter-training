import 'package:injectable/injectable.dart';
import 'package:shopping_app/data/datasources/auth_local_datasource.dart';
import 'package:shopping_app/data/datasources/auth_remote_datasource.dart';
import 'package:shopping_app/data/models/user_model.dart';
import 'package:shopping_app/domain/repositories/auth_repository_interface.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository{
  final IAuthRemoteDataSource remoteDataSource;
  final IAuthLocalDataSource localDataSource;

  AuthRepository({
    required this.remoteDataSource,
    required this.localDataSource
  });

  @override
  Future<UserModel> login(String username, String password) async {
    UserModel userModel = await remoteDataSource.login(username, password);

    if (userModel.token.isNotEmpty) {
      await localDataSource.saveToken(userModel.token);
    }
    return userModel;
  }

  @override
  Future<void> logout() async {
    await localDataSource.clearToken();
  }

}