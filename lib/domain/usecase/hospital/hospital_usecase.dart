import 'package:dartz/dartz.dart';
import 'package:puskesmas_guntur/data/utils/failure/failure.dart';
import 'package:puskesmas_guntur/domain/entity/hospital/hospital_entity.dart';
import 'package:puskesmas_guntur/domain/repository/domain_repository.dart';

class HospitalUseCase {
  final DomainRepository repository;

  HospitalUseCase(this.repository);

  Future<Either<ResponseFailure, HospitalEntity>> execute() {
    return repository.loadHospital();
  }
}
