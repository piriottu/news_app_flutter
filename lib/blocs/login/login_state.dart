part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

//fase in qui si sta facendo il login
class PerformingLogin extends LoginState {
  @override
  List<Object> get props => [];
}

//fase in qui  il login è completato
class PerformedLogin extends LoginState {
  @override
  List<Object> get props => [];
}
