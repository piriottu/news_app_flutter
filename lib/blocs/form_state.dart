part of 'form_bloc.dart';

class FormState extends Equatable {
  final String? email;
  final String? password;

  const FormState({this.email, this.password});

  bool get isValidEmail =>
      email != null &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email!);

  bool get isValidPassword => password != null && password!.length >= 6;

  bool get isValidForm => isValidEmail && isValidPassword;

  @override
  List<Object?> get props => [email, password];
}
