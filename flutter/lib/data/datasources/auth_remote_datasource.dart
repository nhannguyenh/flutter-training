import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app/data/models/user_model.dart';

abstract class IAuthRemoteDatasource {
  Future<UserModel> login(String username, String password);
}

@LazySingleton(as: IAuthRemoteDatasource)
class AuthRemoteDatasource implements IAuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasource(this.dio);

  @override
  Future<UserModel> login(String username, String password) async {
    try {
      final response = await dio.post('/login', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception("Login failed");
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data["error"]["message"] ?? "Server connection issue");
    }
  }

}