part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
}

class FetchPostsEvent extends PostsEvent{
  @override
  List<Object?> get props => [];//array vuoto di elementi da passare

}
