import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puskesmas_guntur/domain/helper/login-helper.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    LoginHelper loginHelper = LoginHelper();
    on<FetchSignIn>((event, emit) async {
      emit(SignInLoading());

      var data = await loginHelper.loginProcess(
          event.email.toString(), event.password.toString());

      if (data == "Login Berhasil") {
        emit(SignInSuccess());
      } else {
        emit(const SignInFailed("Sign In Gagal!"));
      }
    });
  }
}
