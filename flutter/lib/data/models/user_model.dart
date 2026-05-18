class UserModel {
  final String username;
  final String token;

  UserModel({required this.username, required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"] as Map<String, dynamic>;
    final user = data["user"] as Map<String, dynamic>;

    return UserModel(
      username: user["username"] ?? "",
      token: data["token"] ?? "",
    );
  }
}
