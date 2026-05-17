import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app/data/models/user_profile_model.dart';

abstract class IUserRemoteDataSource {
  Future<UserProfileModel> getUserProfile();
}

@LazySingleton(as: IUserRemoteDataSource)
class UserRemoteDataSource implements IUserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource(this.dio);

  @override
  Future<UserProfileModel> getUserProfile() async {
    try {
      final response = await dio.get("/user");

      if (response.statusCode == 200) {
        return UserProfileModel.fromJson(response.data);
      } else {
        throw Exception("Cannot get user info");
      }
    } on DioException catch(e) {
      throw Exception(e.response?.data["error"]["message"]);
    }
  }
}