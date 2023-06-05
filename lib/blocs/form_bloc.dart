import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_event.dart';

part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(const FormState()) {
    on<FormEvent>((event, emit) {
      mapEventState(event, emit);
    });
  }

 void mapEventState(FormEvent event, Emitter<FormState> emit) async {
    if (event is EmailChangedEvent) {
       emit.call(FormState(email: event.email, password: state.password));
    } else if (event is PasswordChangedEvent) {
       emit.call(FormState(email: state.email, password: event.password));
    }
  }

  void changeEmail(String email) => add(EmailChangedEvent(email));
  void changePassword(String password) => add(PasswordChangedEvent(password));
}
