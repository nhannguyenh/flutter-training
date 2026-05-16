import 'package:shopping_app/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<User> login(String username, String password);
}