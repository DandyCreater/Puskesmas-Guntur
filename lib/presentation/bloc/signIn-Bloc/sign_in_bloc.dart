import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/data/model/user/user_model.dart';
import 'package:puskesmas_guntur/data/service/auth-service.dart';
import 'package:puskesmas_guntur/data/service/user-service.dart';
import 'package:puskesmas_guntur/domain/entity/user/user_entity.dart';
import 'package:puskesmas_guntur/domain/helper/login-helper.dart';
import 'package:puskesmas_guntur/domain/usecase/auth/signIn_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;
  final FacebookSignInUseCase facebookSignInUseCase;
  final GoogleSignInUseCase googleSignInUseCase;
  final UpdateUserUseCase updateUserUseCase;
  SignInBloc(this.signInUseCase, this.facebookSignInUseCase,
      this.googleSignInUseCase, this.updateUserUseCase)
      : super(SignInInitial()) {
    on<FetchSignIn>((event, emit) async {
      emit(SignInLoading());

      try {
        final response =
            await signInUseCase.execute(event.email!, event.password!);
        response.fold((failure) {
          emit(SignInFailed(failure.message));
        }, (result) {
          emit(SignInDispose());
          emit(SignInSuccess(user: result));
        });
      } catch (e) {
        emit(SignInFailed("BLOC Sign In Error $e"));
      }
    });

    on<UpdateUser>((event, emit) async {
      emit(SignInLoading());

      try {
        final response = await updateUserUseCase.execute(event.user!);
        response.fold((failure) {
          emit(SignInFailed(failure.message));
        }, (result) {
          emit(SignInDispose());
          emit(SignInSuccess(user: result));
        });
      } catch (e) {
        emit(SignInFailed("BLOC Update Error $e"));
      }
    });

    on<FetchSignInGoogle>((event, emit) async {
      emit(SignInLoading());

      try {
        final response = await googleSignInUseCase.execute();
        response.fold((failure) {
          emit(SignInFailed(failure.message));
        }, (result) {
          emit(SignInDispose());
          emit(SignInSuccess(user: result));
        });
      } catch (e) {
        emit(SignInFailed("BLOC Login Google Error $e"));
      }
    });

    on<FetchSignInFacebook>((event, emit) async {
      emit(SignInLoading());

      try {
        final response = await facebookSignInUseCase.execute();
        response.fold((failure) {
          emit(SignInFailed(failure.message));
        }, (result) {
          emit(SignInDispose());
          emit(SignInSuccess(user: result));
        });
      } catch (e) {
        emit(SignInFailed("BLOC Login Facebook Error $e"));
      }
    });
  }
}
