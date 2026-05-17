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
    return UserProfileModel(
      username: "",
      firstName: "",
      lastName: "",
      email: "",
      age: 0,
    );
  }
}
