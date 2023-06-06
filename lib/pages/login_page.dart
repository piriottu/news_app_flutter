import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/blocs/form/form_bloc.dart' as B;
import 'package:news_app_flutter/blocs/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello!')),
      body: BlocBuilder<B.FormBloc, B.FormState>(
        builder: (context, state) => BlocBuilder<LoginBloc, LoginState>(
          builder: (context, loginState) => Column(
            children: [
              _email(context, state, loginState),
              _password(context, state, loginState),
              _loginButton(context, state, loginState),
              //aggiungo progress bar
              if(loginState is PerformingLogin)
                _circularProgressBar()
            ],
          ),
        ),
      ),
    );
  }

  Widget _circularProgressBar() => const CircularProgressIndicator(backgroundColor: Colors.red,);

  Widget _email(
          BuildContext context, B.FormState state, LoginState loginState) =>
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            //disabilito l'edit una volta premuto sul bottone login
            enabled: loginState is! PerformingLogin,
            decoration: InputDecoration(
              hintText: 'inseriesci email',
              labelText: 'Email',
              errorText: !state.isValidEmail ? 'E-mail non valida' : null,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: context.watch<B.FormBloc>().changeEmail,
          ));

  Widget _password(
          BuildContext context, B.FormState state, LoginState loginState) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          //disabilito l'edit una volta premuto sul bottone login
          enabled: loginState is! PerformingLogin,
          decoration: InputDecoration(
              hintText: 'inserisci password',
              labelText: 'Password',
              errorText: !state.isValidPassword ? 'Password non esatta' : null),
          keyboardType: TextInputType.text,
          onChanged: context.watch<B.FormBloc>().changePassword,
          obscureText: true,
        ),
      );

  Widget _loginButton(
          BuildContext context, B.FormState state, LoginState loginState) =>
      Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
              //disabilito bottone se i cambi non sono esatti o se c'è un login in corso
              onPressed: state.isValidForm && loginState is! PerformingLogin
                  ? () => context
                      .read<LoginBloc>()
                      .performLogin(state.email!, state.password!)
                  : null,
              child: const Text('Next')));
}
