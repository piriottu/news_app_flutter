import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/blocs/posts/posts_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainView extends StatelessWidget {
  final String name;

  const MainView({super.key, required this.name});

  @override
  Widget build(BuildContext context) => Column(
    children:[
      Text('${AppLocalizations.of(context)!.welcome_description} $name'),
      BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if(state is ErrorPostsState){
          return _errorPostState(state.error);
        }else if(state is FetchingPostsState){
          return _loadPostState();
        }else if(state is NoPostsState){
          return _noPostState('Non ci sono post');
        }else if( state is FetchedPostsState){
        return  _noPostState('Post letti : ${state.postsList.body}');
        }
        return Container();
      })
    ],
  );
}

Widget _errorPostState(String error) => Center(child: Text(error));
Widget _noPostState(String error) => Center(child: Text(error));
Widget _loadPostState() => const Center(child: CircularProgressIndicator());