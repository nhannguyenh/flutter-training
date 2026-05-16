import 'package:shopping_app/domain/entities/user.dart';
import 'package:shopping_app/domain/repositories/user_repository_interface.dart';

class LoginUseCase {
  final IUserRepository repository;

  LoginUseCase(this.repository);

  Future<User> login(String username, String password) {
    return repository.login(username, password);
  }
}