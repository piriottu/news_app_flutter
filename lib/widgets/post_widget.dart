import 'package:flutter/cupertino.dart';
import 'package:news_app_flutter/models/post_response_two.dart';

class PostWidget extends StatelessWidget{
  final PostResponseTwo postsList;

  const PostWidget({super.key, required this.postsList});

  @override
  Widget build(BuildContext context) => Column(
    children: [
    Text(postsList.body!),
      Text(postsList.title!),
    ],
  );
}
