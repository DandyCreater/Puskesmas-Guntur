import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:puskesmas_guntur/data/model/user/user_model.dart';
import 'package:puskesmas_guntur/data/utils/failure/failure.dart';
import 'package:puskesmas_guntur/domain/entity/user/user_entity.dart';
import 'package:puskesmas_guntur/domain/repository/domain_repository.dart';

class SignInUseCase {
  final DomainRepository repository;

  SignInUseCase(this.repository);

  Future<Either<ResponseFailure, UserEntity>> execute(
      String email, String password) {
    return repository.doSignIn(email, password);
  }
}

class FacebookSignInUseCase {
  final DomainRepository repository;
  FacebookSignInUseCase(this.repository);

  Future<Either<ResponseFailure, UserEntity>> execute() {
    return repository.facebookSignIn();
  }
}

class GoogleSignInUseCase {
  final DomainRepository repository;

  GoogleSignInUseCase(this.repository);

  Future<Either<ResponseFailure, UserEntity>> execute() {
    return repository.googleSignIn();
  }
}

class UpdateUserUseCase {
  final DomainRepository repository;

  UpdateUserUseCase(this.repository);

  Future<Either<ResponseFailure, UserEntity>> execute(UserModel users) {
    return repository.doUpdateUser(users);
  }
}
