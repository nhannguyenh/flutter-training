import 'package:shopping_app/data/datasources/user_remote_datasource.dart';
import 'package:shopping_app/domain/entities/user.dart';
import 'package:shopping_app/domain/repositories/user_repository_interface.dart';

class UserRepository implements IUserRepository{
  final IUserRemoteDatasource remoteDatasource;

  UserRepository(this.remoteDatasource);

  @override
  Future<User> login(String username, String password) async {
    return await remoteDatasource.login(username, password);
  }

}