class UserProfileModel {
  String username;
  String firstName;
  String lastName;
  String email;
  int age;

  UserProfileModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"] as Map<String, dynamic>;
    return UserProfileModel(
      username: data["username"] ?? "",
      firstName: data["firstName"] ?? "",
      lastName: data["lastName"] ?? "",
      email: data["email"] ?? "",
      age: data["age"] ?? 0,
    );
  }
}
