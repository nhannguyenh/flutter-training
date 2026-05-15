import 'package:dio/dio.dart';

class AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasource(this.dio);

  Future<String> login({required String email, required String password}) async {
    final response = await dio.post(
      "/login",
      data: {
        "email": email,
        "password": password
      }
    );
    return response.data["token"];
  }
}