import 'package:injectable/injectable.dart';
import 'package:shopping_app/data/models/user_profile_model.dart';
import 'package:shopping_app/domain/repositories/user_repository_interface.dart';

@injectable
class UserProfileUseCase {
  final IUserRepository userRepository;

  UserProfileUseCase(this.userRepository);

  Future<UserProfileModel> getUserProfile() {
    return userRepository.getUserProfile();
  }
}