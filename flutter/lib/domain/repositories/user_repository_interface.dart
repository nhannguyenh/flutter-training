import 'package:shopping_app/data/models/user_profile_model.dart';

abstract class IUserRepository {
  Future<UserProfileModel> getUserProfile();
}