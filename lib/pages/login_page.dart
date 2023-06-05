import 'package:flutter/material.dart';
import 'package:news_app_flutter/providers/login_service_provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Hello!')),
        body: Column(
          children: [
            _email(context),
            _password(context),
            _loginButton(context),
          ],
        ));
  }

  Widget _email(BuildContext context) => StreamBuilder(
      stream: LoginServiceProvider.of(context)!.loginService.getEmailStream,
      builder: (context, snapshot) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'inseriesci email',
                labelText: 'Email',
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: LoginServiceProvider.of(context)!
                  .loginService
                  .getChangeEmailSink,
            ));
      });

  Widget _password(BuildContext context) => StreamBuilder(
      stream: LoginServiceProvider.of(context)!.loginService.getPasswordStream,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'inserisci password',
                labelText: 'Password',
                errorText:
                    snapshot.hasError ? snapshot.error.toString() : null),
            keyboardType: TextInputType.text,
            onChanged: LoginServiceProvider.of(context)!
                .loginService
                .getChangePasswordSink,
            obscureText: true,
          ),
        );
      });

  Widget _loginButton(BuildContext context) => StreamBuilder(
      stream:
          LoginServiceProvider.of(context)!.loginService.isEnableLoginBtnStream,
      builder: (context, snapshot) {
        return Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: snapshot.data == true ? () {} : null,
                child: const Text('Next')));
      });
}
