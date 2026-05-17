import 'package:shopping_app/data/models/user_profile_model.dart';

abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfileModel user;

  UserProfileLoaded(this.user);
}

class UserProfileError extends UserProfileState {
  String errorMessage;

  UserProfileError(this.errorMessage);
}
