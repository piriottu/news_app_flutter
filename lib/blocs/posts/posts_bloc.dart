import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_flutter/models/post_response_two.dart';
import 'package:news_app_flutter/network/rest_client.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final RestClient? restClient;

  PostsBloc({this.restClient}) : super(FetchingPostsState()) {
    on<PostsEvent>(_mapEventState);
  }

  void _mapEventState(PostsEvent event, Emitter<PostsState> emit) async {
    if (event is FetchPostsEvent) {
      emit(FetchingPostsState());

      PostResponseTwo? response;
      try {
        response = await restClient!.posts();
      } catch (error) {
        emit(ErrorPostsState(error.toString()));
      }

      if (response != null) {
        emit(FetchedPostsState(response));
      } else {
        emit(NoPostsState());
      }
    }
  }

  void fetchPosts() => add(FetchPostsEvent());
}
