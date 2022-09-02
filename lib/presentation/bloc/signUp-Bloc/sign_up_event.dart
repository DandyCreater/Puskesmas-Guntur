// ignore_for_file: non_constant_identifier_names

part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpProcess extends SignUpEvent {
  final String? email;
  final String? password;
  final String? phone_num;

  const SignUpProcess(
      // ignore: non_constant_identifier_names
      {required this.email,
      required this.password,
      required this.phone_num});

  @override
  // TODO: implement props
  List<Object> get props => [email!, password!, phone_num!];
}
