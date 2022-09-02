import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puskesmas_guntur/data/service/auth-service.dart';
import 'package:puskesmas_guntur/data/service/user-service.dart';

part 'forgotpassword_event.dart';
part 'forgotpassword_state.dart';

class ForgotpasswordBloc
    extends Bloc<ForgotpasswordEvent, ForgotpasswordState> {
  ForgotpasswordBloc() : super(ForgotpasswordInitial()) {
    on<FetchForgotPassword>((event, emit) async {
      AuthService authService = AuthService();
      emit(ForgotpasswordLoading());

      try {
        var process = await authService.forgotPassword(event.email!);
        if (process != null) {
          emit(ForgotpasswordSuccess());
        } else {
          emit(const ForgotpasswordFailed(message: 'Reset Password Failed'));
        }
      } catch (e) {
        emit(const ForgotpasswordFailed(message: "Error"));
      }
    });
  }
}
