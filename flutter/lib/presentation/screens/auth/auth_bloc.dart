import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/domain/usecases/login_usecase.dart';
import 'package:shopping_app/presentation/screens/auth/auth_event.dart';
import 'package:shopping_app/presentation/screens/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final LoginUseCase loginUseCase;
  
  AuthBloc(this.loginUseCase) : super(LoginInitialState()) {
    on<LoginEvent>(_onLoginEvent);
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      await loginUseCase.login(event.email, event.password);
      emit(LoginSuccessState());
    } catch (e) {
      // TODO
    }
  }
}