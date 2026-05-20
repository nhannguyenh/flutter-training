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

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      username: map['username'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      age: map['age'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "age": age
    };
  }
}
