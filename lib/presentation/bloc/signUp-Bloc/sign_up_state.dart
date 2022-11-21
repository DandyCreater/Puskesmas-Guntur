part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpDispose extends SignUpState {}

class SignUpSucess extends SignUpState {
  final UserEntity? user;

  const SignUpSucess({required this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user!];
}

class SignUpFailed extends SignUpState {
  final String? message;

  const SignUpFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
