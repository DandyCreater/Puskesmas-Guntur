import 'package:dartz/dartz.dart';
import 'package:puskesmas_guntur/data/utils/failure/failure.dart';
import 'package:puskesmas_guntur/domain/entity/carousel/carousel_entity.dart';
import 'package:puskesmas_guntur/domain/repository/domain_repository.dart';

class CarouselUseCase {
  final DomainRepository repository;

  CarouselUseCase(this.repository);

  Future<Either<ResponseFailure, CarouselEntity>> execute() {
    return repository.loadCarousel();
  }
}
