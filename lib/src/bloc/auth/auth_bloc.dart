// BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapistschedules/src/bloc/auth/auth_state.dart';

import '../../bloc/auth_bloc.dart:.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
  }

  void _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    // Dummy validation logic
    await Future.delayed(Duration(seconds: 2));
    if (event.userId == 'user123' && event.password == 'pass123') {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: 'Invalid user ID or password'));
    }
  }
}
