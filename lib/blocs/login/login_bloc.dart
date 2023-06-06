import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_flutter/blocs/authentication/authentication_cubit.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //in caso di autenticazione dobbiamo aggiornare anche lo stato di cubit auth
  final AuthenticationCubit authenticationCubit;

  LoginBloc(this.authenticationCubit) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      callMockLoginState(event, emit);
    });
  }

  //creo una chiamata mock
  void callMockLoginState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is PerformLogin) {
      print(
          'Stai facendo login con email:${event.email}\n Hai introdotto la psw:${event.password}');
      //mostro una progress
      await Future.delayed(const Duration(seconds: 3), () {});
      authenticationCubit.setAuthenticated();
      emit.call(PerformedLogin());
    }/* else if (event is PasswordChangedEvent) {
      emit.call(FormState(email: state.email, password: event.password));
    }*/
  }

  //permettiamo ad un utente di eseguire l'accesso e rimappare un evento
  void performLogin(String email, String password) =>
      add(PerformLogin(email, password));
}
