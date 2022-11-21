import 'package:dartz/dartz.dart';
import 'package:puskesmas_guntur/data/datasources/local_data_sources.dart';
import 'package:puskesmas_guntur/data/datasources/remote_data_sources.dart';
import 'package:puskesmas_guntur/data/model/article/article_model.dart';
import 'package:puskesmas_guntur/data/model/carousel/carousel_model.dart';
import 'package:puskesmas_guntur/data/model/hospital/hospital_model.dart';
import 'package:puskesmas_guntur/data/model/pelayanan/pelayanan_model.dart';
import 'package:puskesmas_guntur/data/model/user/user_model.dart';

import 'package:puskesmas_guntur/data/utils/failure/failure.dart';

import 'package:puskesmas_guntur/domain/entity/article/article_entity.dart';
import 'package:puskesmas_guntur/domain/entity/carousel/carousel_entity.dart';
import 'package:puskesmas_guntur/domain/entity/hospital/hospital_entity.dart';
import 'package:puskesmas_guntur/domain/entity/pelayanan/pelayanan_entity.dart';
import 'package:puskesmas_guntur/domain/entity/user/user_entity.dart';

import 'package:puskesmas_guntur/domain/repository/domain_repository.dart';

class DataRepositoryImpl extends DomainRepository {
  final LocalDataSources localDataSources;
  final RemoteDataSources remoteDataSources;

  DataRepositoryImpl(
      {required this.localDataSources, required this.remoteDataSources});

  @override
  Future<Either<ResponseFailure, ArticleEntity>> loadArticle() async {
    try {
      ArticleModel response = await localDataSources.fetchArticle();
      if (response.responseStatus == "OK") {
        return right(response.toEntity());
      } else {
        return left(ResponseFailure("Fetch Article Error"));
      }
    } catch (e) {
      return Left(ResponseFailure("Error Catch Article $e"));
    }
  }

  @override
  Future<Either<ResponseFailure, CarouselEntity>> loadCarousel() async {
    try {
      CarouselModel response = await localDataSources.fetchCarousel();
      if (response.responseStatus == "OK") {
        return right(response.toEntity());
      }
      return left(ResponseFailure("Fetch Carousel Error"));
    } catch (e) {
      return Left(ResponseFailure("Error Catch Fetch Carousel $e"));
    }
  }

  @override
  Future<Either<ResponseFailure, HospitalEntity>> loadHospital() async {
    try {
      HospitalModel response = await localDataSources.fetchHospital();
      if (response.responseStatus == "OK") {
        return right(response.toEntity());
      }
      return left(ResponseFailure("Fetch Hospital Error"));
    } catch (e) {
      return Left(ResponseFailure("Error Catch Fetch Hospital $e"));
    }
  }

  @override
  Future<Either<ResponseFailure, PelayananEntity>> loadPelayanan() async {
    try {
      PelayananModel response = await localDataSources.fetchPelayanan();
      if (response.responseStatus == "OK") {
        return right(response.toEntity());
      }
      return left(ResponseFailure("Fetch Pelayanan Error"));
    } catch (e) {
      return Left(ResponseFailure("Error Catch Fetch Pelayanan $e"));
    }
  }

  //Auth Firebase Area
  @override
  Future<Either<ResponseFailure, UserEntity>> doSignIn(
      String email, String password) async {
    try {
      UserModel response =
          await remoteDataSources.signIn(email: email, password: password);
      if (response.id != null) {
        return right(response.toEntity());
      } else {
        return left(ResponseFailure(response.name!));
      }
    } catch (e) {
      return Left(ResponseFailure("Error Catch Sign In $e"));
    }
  }

  @override
  Future<Either<ResponseFailure, UserEntity>> facebookSignIn() async {
    try {
      UserModel response = await remoteDataSources.signUpWithFacebook();
      if (response.id != null) {
        return right(response.toEntity());
      } else {
        return left(ResponseFailure("Facebook Sign In Failed"));
      }
    } catch (e) {
      return Left(ResponseFailure("Error Catch Sign In Facebook $e"));
    }
  }

  @override
  Future<Either<ResponseFailure, UserEntity>> googleSignIn() async {
    try {
      UserModel response = await remoteDataSources.signUpWithGoogle();
      if (response.id != null) {
        return right(response.toEntity());
      } else {
        return left(ResponseFailure("Google Sign In Failed"));
      }
    } catch (e) {
      return Left(ResponseFailure("Error Catch Sign In Google $e"));
    }
  }

  @override
  Future<Either<ResponseFailure, UserEntity>> doSignUp(
      String email, String password, String phone_num) async {
    try {
      UserModel response = await remoteDataSources.signUp(
          email: email, password: password, phone_num: phone_num);
      if (response.id != null) {
        return right(response.toEntity());
      } else {
        return left(ResponseFailure(response.name!));
      }
    } catch (e) {
      return Left(ResponseFailure("Error Catch Sign Up $e"));
    }
  }

  @override
  Future<Either<ResponseFailure, String>> doForgotPassword(String email) async {
    try {
      String response = await remoteDataSources.forgotPassword(email);
      if (response != null) {
        return right("Reset Password Success");
      }
      return left(ResponseFailure("Reset Password Failed"));
    } catch (e) {
      return Left(ResponseFailure("Error Catch Forgot Password $e"));
    }
  }

  @override
  Future<Either<ResponseFailure, UserEntity>> doUpdateUser(
      UserModel user) async {
    try {
      UserModel response = await remoteDataSources.updateUser(user);
      if (response.id != null) {
        return right(response.toEntity());
      } else {
        return left(ResponseFailure("Update User Failed"));
      }
    } catch (e) {
      return Left(ResponseFailure("Error Catch Update User $e"));
    }
  }
}
