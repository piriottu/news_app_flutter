part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();
}

//Cambiamento email
class EmailChangedEvent extends FormEvent {
  final String email;

  const EmailChangedEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChangedEvent extends FormEvent {
  final String password;

  const PasswordChangedEvent(this.password);

  @override
  List<Object?> get props => [password];
}
