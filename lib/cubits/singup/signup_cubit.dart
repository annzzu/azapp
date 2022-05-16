import 'package:azapp/utils/error_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:azapp/repositories/repositories.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  void signUpWithCredentials() async {
    if (!state.isFormValid || state.status == SignupStatus.submitting) return;
    emit(
      state.copyWith(status: SignupStatus.submitting),
    );
    await _authRepository
        .signUp(
          email: state.email,
          password: state.password,
        )
        .then((value) => emit(
              state.copyWith(status: SignupStatus.success),
            ))
        .catchError((onError) => emit(
              onError.code == ErrorHandler.emailExists
                  ? state.copyWith(status: SignupStatus.emailExists)
                  : state.copyWith(status: SignupStatus.error),
            ));
  }
}
