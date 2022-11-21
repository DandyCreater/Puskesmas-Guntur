import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ResponseFailure extends Failure {
  ResponseFailure(String message) : super(message);
}
