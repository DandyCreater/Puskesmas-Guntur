part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class FetchSignIn extends SignInEvent {
  String? email;
  String? password;

  FetchSignIn({this.email, this.password});

  @override
  // TODO: implement props
  List<Object> get props => [email!, password!];
}

class UserFetch extends SignInEvent {
  final OKContentUser? userData;

  const UserFetch({required this.userData});

  @override
  // TODO: implement props
  List<Object> get props => [userData!];
}
