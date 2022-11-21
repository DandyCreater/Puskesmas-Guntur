part of 'forgotpassword_bloc.dart';

abstract class ForgotpasswordState extends Equatable {
  const ForgotpasswordState();

  @override
  List<Object> get props => [];
}

class ForgotpasswordInitial extends ForgotpasswordState {}

class ForgotpasswordLoading extends ForgotpasswordState {}

class ForgotpasswordDisposes extends ForgotpasswordState {}

class ForgotpasswordSuccess extends ForgotpasswordState {}

class ForgotpasswordFailed extends ForgotpasswordState {
  final String? message;

  const ForgotpasswordFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
