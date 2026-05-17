import 'package:injectable/injectable.dart';
import 'package:shopping_app/data/datasources/user_remote_datasource.dart';
import 'package:shopping_app/data/models/user_profile_model.dart';
import 'package:shopping_app/domain/repositories/user_repository_interface.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IUserRemoteDataSource remoteDataSource;

  UserRepository({required this.remoteDataSource});

  @override
  Future<UserProfileModel> getUserProfile() async {
    return await remoteDataSource.getUserProfile();
  }
}
