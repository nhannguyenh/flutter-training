import 'package:shopping_app/domain/entities/user.dart';

abstract class IUserRepository {
  Future<User> login(String username, String password);
}