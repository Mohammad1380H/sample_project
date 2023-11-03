import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/bloc/blocs.dart';
import 'package:sample_project/bloc/event.dart';
import 'package:sample_project/bloc/state.dart';
import 'package:sample_project/repository/repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Repository repository = RepositoryProvider.of(context);
    return BlocProvider(
      create: (context) {
        return ArticleBloc(repository);
      },
      child: Scaffold(
          floatingActionButton: ElevatedButton(
            onPressed: () {
              BlocProvider.of<ArticleBloc>(context).add(LoadArticleEvent());
            },
            child: const Icon(Icons.download),
          ),
          body: BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) {
              if (state is AritcleLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AritcleLoadedState) {
                return ListView.builder(
                    itemCount: state.articles.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.articles[index].title!,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }));
              } else if (state is AritcleErrorState) {
                return Center(child: Text(state.errorText));
              }
              return const Center(child: Text('...'));
            },
          )),
    );
  }
}
