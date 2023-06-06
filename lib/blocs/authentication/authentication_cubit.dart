import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(NotAuthenticated());

  void setAuthenticated() => emit(Authenticated());

  void setUnauthenticated() => emit(NotAuthenticated());
}
