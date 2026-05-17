import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app/domain/usecases/user_profile_usecase.dart';
import 'package:shopping_app/presentation/screens/profile/bloc/user_profile_event.dart';
import 'package:shopping_app/presentation/screens/profile/bloc/user_profile_state.dart';

@injectable
class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileUseCase _userProfileUseCase;

  UserProfileBloc(this._userProfileUseCase) : super(UserProfileInitial()) {
    on<FetchUserProfileData>(_onFetchUserProfileData);
  }

  Future<void> _onFetchUserProfileData(FetchUserProfileData event, Emitter emit) async {
    emit(UserProfileLoading());

    try {
      final userProfile = await _userProfileUseCase.getUserProfile();
      emit(UserProfileLoaded(userProfile));
    } catch(e) {
      emit(UserProfileError(e.toString()));
    }
  }
}
