part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {
  final OKContentArticle? okContentArticle;

  const ArticleSuccess(this.okContentArticle);

  @override
  // TODO: implement props
  List<Object> get props => [okContentArticle!];
}

class ArticleFailed extends ArticleState {
  final String? message;

  const ArticleFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
