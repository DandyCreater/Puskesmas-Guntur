part of 'forgotpassword_bloc.dart';

abstract class ForgotpasswordEvent extends Equatable {
  const ForgotpasswordEvent();

  @override
  List<Object> get props => [];
}

class FetchForgotPassword extends ForgotpasswordEvent {
  final String? email;

  const FetchForgotPassword({required this.email});

  @override
  // TODO: implement props
  List<Object> get props => [email!];
}
