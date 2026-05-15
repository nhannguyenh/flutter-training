import 'package:shopping_app/data/repositories/auth_repository.dart';

class LoginUseCase {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> login(String email, String password) async {
    await repository.login(email, password);
  }
}