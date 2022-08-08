part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class FetchArticle extends ArticleEvent {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
