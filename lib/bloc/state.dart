import 'package:equatable/equatable.dart';
import 'package:sample_project/model/article_model.dart';

abstract class ArticleState extends Equatable {}

class AritcleLoadingState extends ArticleState {
  @override
  List<Object?> get props => [];
}

class AritcleLoadedState extends ArticleState {
  final List<ArticleModel> articles;
  AritcleLoadedState(this.articles);
  @override
  List<Object?> get props => [articles];
}
class AritcleErrorState extends ArticleState {
  final String errorText;
  AritcleErrorState(this.errorText);
  @override
  List<Object?> get props => [errorText];
}


