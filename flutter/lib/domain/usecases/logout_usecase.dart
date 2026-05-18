import 'package:injectable/injectable.dart';
import 'package:shopping_app/domain/repositories/auth_repository_interface.dart';

@injectable
class LogoutUseCase {
  final IAuthRepository repository;

  LogoutUseCase(this.repository);

  Future<void> logout() async {
    await repository.logout();
  }
}