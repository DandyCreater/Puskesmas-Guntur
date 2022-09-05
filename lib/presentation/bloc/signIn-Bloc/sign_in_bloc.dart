import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/data/service/auth-service.dart';
import 'package:puskesmas_guntur/data/service/user-service.dart';
import 'package:puskesmas_guntur/domain/helper/login-helper.dart';
import 'package:puskesmas_guntur/domain/model/user-model/user_model.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<FetchSignIn>((event, emit) async {
      emit(SignInLoading());

      try {
        var user = await AuthService().signIn(
            email: event.email.toString(), password: event.password.toString());
        emit(SignInSuccess(user: user));
      } catch (e) {
        emit(const SignInFailed("Sign In Error"));
      }
    });

    on<UpdateUser>((event, emit) async {
      emit(SignInLoading());

      try {
        var userUpdate = await AuthService().updateUser(user: event.user!);
        emit(SignInSuccess(user: userUpdate));
      } catch (e) {
        print(e);
        emit(const SignInFailed("Update Error"));
      }
    });

    on<FetchSignInGoogle>((event, emit) async {
      emit(SignInLoading());

      try {
        var user = await AuthService().signUpWithGoogle();
        emit(SignInSuccess(user: user));
      } catch (e) {
        print(e);
        emit(const SignInFailed("Login Google Error"));
      }
    });

    on<FetchSignInFacebook>((event, emit) async {
      emit(SignInLoading());

      try {
        var user = await AuthService().singUpWithFacebook();
        emit(SignInSuccess(user: user));
      } catch (e) {
        print(e);
        emit(const SignInFailed("Login Facebook Error"));
      }
    });
  }
}
