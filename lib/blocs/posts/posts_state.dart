part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();
}

//Mostrare progress in attesa di risposta da parte del server
class FetchingPostsState extends PostsState {
  @override
  List<Object> get props =>
      []; //Mostrare progress in attesa di risposta da parte del server
}

//Mostrare lista di post
class FetchedPostsState extends PostsState {
  final PostResponseTwo postsList;

  const FetchedPostsState(this.postsList);
  @override
  List<Object> get props => [postsList]; //Mostrare lista di post
}

//In caso di lista vuota
class NoPostsState extends PostsState {
  @override
  List<Object> get props => []; //Mostrare lista vuota
}

//In caso di errore
class ErrorPostsState extends PostsState {
  final String error;

  const ErrorPostsState(this.error);

  @override
  List<Object> get props => [error]; //Mostrare contenuto errore
}
