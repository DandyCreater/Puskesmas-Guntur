import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/domain/helper/login-helper.dart';
import 'package:puskesmas_guntur/domain/model/user-model/user_model.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    LoginHelper loginHelper = LoginHelper();
    on<FetchSignIn>((event, emit) async {
      emit(SignInLoading());

      var data = await loginHelper.loginProcess(
          event.email.toString(), event.password.toString());

      var userData = await loginHelper.userProcess(
          event.email.toString(), event.password.toString());

      OKContentUser user = OKContentUser();
      user.user = userData;

      // ignore: unrelated_type_equality_checks
      if (data == "Login Berhasil") {
        emit(SignInSuccess(user: user));
      } else {
        emit(const SignInFailed("Sign In Gagal!"));
      }
    });
  }
}
