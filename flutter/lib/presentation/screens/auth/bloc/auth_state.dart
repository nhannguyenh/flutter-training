import 'package:shopping_app/domain/entities/user.dart';

abstract class AuthState {}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final User user;
  LoginSuccess(this.user);
}

class LoginFailure extends AuthState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

class LogoutLoading extends AuthState {}

class UnAuthenticated extends AuthState {}

class LogoutFailure extends AuthState {
  final String errorMessage;
  LogoutFailure(this.errorMessage);
}