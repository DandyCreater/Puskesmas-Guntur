import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/domain/entity/article/article_entity.dart';
import 'package:puskesmas_guntur/domain/usecase/article/article_usecase.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleUseCase articleUseCase;
  ArticleBloc(this.articleUseCase) : super(ArticleInitial()) {
    on<FetchArticle>((event, emit) async {
      try {
        final result = await articleUseCase.execute();

        result.fold((failure) {
          emit(ArticleFailed(failure.message));
        }, (response) {
          emit(ArticleSuccess(response.oKContentArticle));
        });
      } catch (e) {
        emit(const ArticleFailed("BLOC FETCH ARTICLE ERROR"));
      }
    });
  }
}
