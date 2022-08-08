part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailed extends SignInState {
  final String? message;

  const SignInFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
