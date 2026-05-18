import 'package:shopping_app/data/models/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel> login(String username, String password);
  Future<void> logout();
}