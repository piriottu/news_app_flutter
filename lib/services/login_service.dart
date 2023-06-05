import 'package:news_app_flutter/mixins/validators_mixin.dart';
import 'package:rxdart/rxdart.dart';

class LoginService with ValidatorMixin {
  //stream  StreamController gestisce solo un flisso ci sono 2 flusso uno è quelo per la gestione dell email o password, il secondo per Rx.combineLatest2
  //BehaviorSubject (sottoscrione multipla) invece gestisce più flussi contemporanei
  final BehaviorSubject<String> _emailController = BehaviorSubject();
  final BehaviorSubject<String> _passwordController = BehaviorSubject();

  Stream<String> get getEmailStream =>
      _emailController.stream.transform(validateEmail);

  Stream<String> get getPasswordStream =>
      _passwordController.stream.transform(validatePassword);

  //Unisce due stream per restituire un unico dato che non sia un errore
  Stream<bool> get isEnableLoginBtnStream =>
      Rx.combineLatest2(getEmailStream, getPasswordStream, (a, b) => true);

  Function(String) get getChangeEmailSink => _emailController.sink.add;

  Function(String) get getChangePasswordSink => _passwordController.sink.add;

  //deallocano in demoria
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
