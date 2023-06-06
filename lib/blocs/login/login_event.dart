part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class PerformLogin extends LoginEvent {
  final String? email;
  final String? password;

  const PerformLogin(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
