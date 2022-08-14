part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final OKContentUser? user;

  const SignInSuccess({this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user!];
}

class SignInFailed extends SignInState {
  final String? message;

  const SignInFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
