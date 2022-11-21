import 'package:dartz/dartz.dart';
import 'package:puskesmas_guntur/data/utils/failure/failure.dart';
import 'package:puskesmas_guntur/domain/entity/pelayanan/pelayanan_entity.dart';
import 'package:puskesmas_guntur/domain/repository/domain_repository.dart';

class PelayananUseCase {
  final DomainRepository repository;

  PelayananUseCase(this.repository);

  Future<Either<ResponseFailure, PelayananEntity>> execute() {
    return repository.loadPelayanan();
  }
}
