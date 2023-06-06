import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/blocs/form/form_bloc.dart' as B;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello!')),
      body: BlocBuilder<B.FormBloc, B.FormState>(
        builder: (context, state) => Column(
          children: [
            _email(context, state),
            _password(context, state),
            _loginButton(context, state),
          ],
        ),
      ),
    );
  }

  Widget _email(BuildContext context,B.FormState state) =>
         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'inseriesci email',
                labelText: 'Email',
                errorText: !state.isValidEmail ?'E-mail non valida' : null,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: context.watch<B.FormBloc>().changeEmail,
            ));

  Widget _password(BuildContext context,B.FormState state) =>  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'inserisci password',
                labelText: 'Password',
                errorText:
                    !state.isValidPassword ? 'Password non esatta' : null),
            keyboardType: TextInputType.text,
            onChanged: context.watch<B.FormBloc>().changePassword,
            obscureText: true,
          ),
        );

  Widget _loginButton(BuildContext context,B.FormState state) =>  Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: state.isValidForm == true ? () {} : null,
                child: const Text('Next')));
}
