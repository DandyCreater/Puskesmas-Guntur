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

class UpdateUser extends SignInEvent {
  final UserModel? user;

  const UpdateUser({this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user!];
}

class FetchSignInGoogle extends SignInEvent {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
