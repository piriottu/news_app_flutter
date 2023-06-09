import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/blocs/posts/posts_bloc.dart';
import 'package:news_app_flutter/network/rest_client.dart';
import 'package:news_app_flutter/pages/hello_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => RestClient())],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    PostsBloc(restClient: context.read<RestClient>()
                    )..fetchPosts()
            )
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HelloPage(),
          )));
}
