import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puskesmas_guntur/data/service/auth-service.dart';
import 'package:puskesmas_guntur/data/service/user-service.dart';
import 'package:puskesmas_guntur/domain/model/user-model/user_model.dart';
import 'package:puskesmas_guntur/presentation/bloc/signIn-Bloc/sign_in_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpProcess>((event, emit) async {
      emit(SignUpLoading());
      try {
        var userSignUp = await AuthService().signUp(
            email: event.email.toString(),
            password: event.password.toString(),
            phone_num: event.phone_num.toString());

        emit(SignUpSucess(user: userSignUp));
      } catch (e) {
        print(e);
        if (e ==
            "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
          emit(const SignUpFailed(message: "Email sudah Terdaftar"));
        } else {
          emit(const SignUpFailed(message: "Sign Up Error"));
        }
      }
    });
  }
}
