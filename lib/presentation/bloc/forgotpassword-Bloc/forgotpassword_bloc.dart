import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puskesmas_guntur/data/service/auth-service.dart';
import 'package:puskesmas_guntur/data/service/user-service.dart';
import 'package:puskesmas_guntur/domain/usecase/auth/forgotpasswrod_usecase.dart';

part 'forgotpassword_event.dart';
part 'forgotpassword_state.dart';

class ForgotpasswordBloc
    extends Bloc<ForgotpasswordEvent, ForgotpasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  ForgotpasswordBloc(this.forgotPasswordUseCase)
      : super(ForgotpasswordInitial()) {
    on<FetchForgotPassword>((event, emit) async {
      // AuthService authService = AuthService();
      emit(ForgotpasswordLoading());

      try {
        final response = await forgotPasswordUseCase.execute(event.email!);
        response.fold((failure) {
          emit(ForgotpasswordDisposes());
          emit(ForgotpasswordFailed(message: failure.message));
        }, (result) {
          emit(ForgotpasswordDisposes());
          emit(ForgotpasswordSuccess());
        });
      } catch (e) {
        emit(ForgotpasswordFailed(message: "BLOC Forgot Password Error $e"));
      }
    });
  }
}
