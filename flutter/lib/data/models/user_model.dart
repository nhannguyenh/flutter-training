import 'package:shopping_app/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.username,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"] as Map<String, dynamic>;
    final user  = data["user"] as Map<String, dynamic>;

    return UserModel(
      username: user["username"] ?? "",
      token: data["token"] ?? "",
    );
  }
}
