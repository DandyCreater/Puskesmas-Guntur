import 'package:dartz/dartz.dart';
import 'package:puskesmas_guntur/data/model/user/user_model.dart';
import 'package:puskesmas_guntur/data/utils/failure/failure.dart';
import 'package:puskesmas_guntur/domain/entity/article/article_entity.dart';
import 'package:puskesmas_guntur/domain/entity/carousel/carousel_entity.dart';
import 'package:puskesmas_guntur/domain/entity/hospital/hospital_entity.dart';
import 'package:puskesmas_guntur/domain/entity/pelayanan/pelayanan_entity.dart';
import 'package:puskesmas_guntur/domain/entity/user/user_entity.dart';

abstract class DomainRepository {
  Future<Either<ResponseFailure, ArticleEntity>> loadArticle();
  Future<Either<ResponseFailure, CarouselEntity>> loadCarousel();
  Future<Either<ResponseFailure, HospitalEntity>> loadHospital();
  Future<Either<ResponseFailure, PelayananEntity>> loadPelayanan();

  Future<Either<ResponseFailure, UserEntity>> doSignIn(
      String email, String password);
  Future<Either<ResponseFailure, UserEntity>> facebookSignIn();
  Future<Either<ResponseFailure, UserEntity>> googleSignIn();
  Future<Either<ResponseFailure, UserEntity>> doSignUp(
      String email, String password, String phone_num);
  Future<Either<ResponseFailure, String>> doForgotPassword(String email);
  Future<Either<ResponseFailure, UserEntity>> doUpdateUser(UserModel user);
}
