import 'package:dartz/dartz.dart';
import 'package:puskesmas_guntur/data/utils/failure/failure.dart';
import 'package:puskesmas_guntur/domain/repository/domain_repository.dart';

class ForgotPasswordUseCase {
  final DomainRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<Either<ResponseFailure, String>> execute(String email) {
    return repository.doForgotPassword(email);
  }
}
