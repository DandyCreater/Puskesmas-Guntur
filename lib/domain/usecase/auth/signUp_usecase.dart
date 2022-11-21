import 'package:dartz/dartz.dart';
import 'package:puskesmas_guntur/data/utils/failure/failure.dart';
import 'package:puskesmas_guntur/domain/entity/user/user_entity.dart';
import 'package:puskesmas_guntur/domain/repository/domain_repository.dart';

class SignUpUseCase {
  final DomainRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<ResponseFailure, UserEntity>> execute(
      String email, String password, String phone_num) {
    return repository.doSignUp(email, password, phone_num);
  }
}
