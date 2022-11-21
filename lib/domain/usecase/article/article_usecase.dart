import 'package:dartz/dartz.dart';
import 'package:puskesmas_guntur/data/datasources/local_data_sources.dart';
import 'package:puskesmas_guntur/data/utils/failure/failure.dart';
import 'package:puskesmas_guntur/domain/entity/article/article_entity.dart';
import 'package:puskesmas_guntur/domain/repository/domain_repository.dart';

class ArticleUseCase {
  final DomainRepository repository;

  ArticleUseCase(this.repository);

  Future<Either<ResponseFailure, ArticleEntity>> execute() {
    return repository.loadArticle();
  }
}
