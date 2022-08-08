import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/domain/model/article-model/article_model.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<FetchArticle>((event, emit) async {
      final jsonData = await rootBundle.loadString("assets/json/article.json");
      final dataDecode = jsonDecode(jsonData);
      var data = OKContentArticle.fromJson(dataDecode["OKContentArticle"]);

      if (dataDecode["ResponseStatus"] == "OK") {
        emit(ArticleSuccess(data));
      } else {
        emit(const ArticleFailed("Fetch Artile Error !"));
      }
    });
  }
}
