import 'package:injectable/injectable.dart';
import 'package:shopping_app/data/datasources/user_remote_datasource.dart';
import 'package:shopping_app/data/helpers/db_helper.dart';
import 'package:shopping_app/data/models/user_profile_model.dart';
import 'package:shopping_app/domain/repositories/user_repository_interface.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IUserRemoteDataSource remoteDataSource;
  final DbHelper dbHelper;

  UserRepository({required this.remoteDataSource, required this.dbHelper});

  @override
  Future<UserProfileModel> getUserProfile() async {
    try {
      UserProfileModel userProfile = await remoteDataSource.getUserProfile();
      await dbHelper.saveUserProfile(userProfile);
      return userProfile;
    } catch (e) {
      final localUserProfile = await dbHelper.getUserProfile();
      if (localUserProfile != null) {
        return localUserProfile;
      }
      throw Exception(e);
    }
  }
}
