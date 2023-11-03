import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/bloc/event.dart';
import 'package:sample_project/bloc/state.dart';
import 'package:sample_project/model/article_model.dart';
import 'package:sample_project/repository/repository.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  late final Repository _repository;
  ArticleBloc(this._repository) : super(AritcleLoadingState()) {
    on<LoadArticleEvent>(
      (event, emit) async {
        emit(AritcleLoadingState());
        try {
          List<ArticleModel> articles = await _repository.getArticles();
          emit(AritcleLoadedState(articles));
        } catch (error) {
          emit(AritcleErrorState(error.toString()));
        }
      },
    );
  }
}
