import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/blocs/authentication/authentication_cubit.dart';
import 'package:news_app_flutter/blocs/form/form_bloc.dart';
import 'package:news_app_flutter/blocs/login/login_bloc.dart';
import 'package:news_app_flutter/pages/login_page.dart';
import 'package:news_app_flutter/pages/welcome_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FormBloc()),
          BlocProvider(create: (context) => AuthenticationCubit()),
          BlocProvider(
              create: (context) =>
                  LoginBloc(context.read<AuthenticationCubit>())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          //siccome ci saranno due pagine la prima di login la seconda di loggato creiamo un bloc builder
          home: BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) => state is Authenticated
                  ? const WelcomePage()
                  : const LoginPage()),
        ));
  }
}
