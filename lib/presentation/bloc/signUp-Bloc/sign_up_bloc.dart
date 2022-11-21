import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puskesmas_guntur/data/service/auth-service.dart';
import 'package:puskesmas_guntur/data/service/user-service.dart';
import 'package:puskesmas_guntur/domain/entity/user/user_entity.dart';
import 'package:puskesmas_guntur/domain/usecase/auth/signUp_usecase.dart';
import 'package:puskesmas_guntur/presentation/bloc/signIn-Bloc/sign_in_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;
  SignUpBloc(this.signUpUseCase) : super(SignUpInitial()) {
    on<SignUpProcess>((event, emit) async {
      emit(SignUpLoading());
      try {
        final response = await signUpUseCase.execute(
            event.email!, event.password!, event.phone_num!);
        response.fold((failure) {
          emit(SignUpFailed(message: failure.message));
        }, (result) {
          emit(SignUpDispose());
          emit(SignUpSucess(user: result));
        });
      } catch (e) {
        emit(SignUpFailed(message: "BLOC SIGN UP ERROR $e"));
      }
    });
  }
}
