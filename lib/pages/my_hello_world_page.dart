import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MyHelloWorldPage extends StatefulWidget {
  const MyHelloWorldPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHelloWorldPage();
}

class _MyHelloWorldPage extends State<MyHelloWorldPage> {
  //stream  StreamController gestisce solo un flisso ci sono 2 flusso uno è quelo per la gestione dell email o password, il secondo per Rx.combineLatest2
  //BehaviorSubject (sottoscrione multipla) invece gestisce più flussi contemporanei
  final BehaviorSubject<String> _emailController = BehaviorSubject();
  final BehaviorSubject<String> _passwordController = BehaviorSubject();

  //controllo se gli stream rispondono alle condizioni ( trasorma i dati in ingresso di uno stream in dati di output )
  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email non valida');
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Password non valida');
    }
  });

  Stream<String> get _getEmailStream =>
      _emailController.stream.transform(_validateEmail);

  Stream<String> get _getPasswordStream =>
      _passwordController.stream.transform(_validatePassword);

  //Unisce due stream per restituire un unico dato che non sia un errore
  Stream<bool> get _isEnableLoginBtnStream =>
      Rx.combineLatest2(_getEmailStream, _getPasswordStream, (a, b) => true);

  //deallocano in demoria
  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Hello!')),
        body: Column(
          children: [
            _email(),
            _password(),
            _loginButton(),
          ],
        ));
  }

  Widget _email() => StreamBuilder(
      stream: _getEmailStream,
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
              onChanged: _emailController.sink.add,
            ));
      });

  Widget _password() => StreamBuilder(
      stream: _getPasswordStream,
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
            onChanged: _passwordController.sink.add,
            obscureText: true,
          ),
        );
      });

  Widget _loginButton() => StreamBuilder(
      stream: _isEnableLoginBtnStream,
      builder: (context, snapshot) {
        return Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: snapshot.data == true ? () {} : null,
                child: const Text('Next')));
      });
}
