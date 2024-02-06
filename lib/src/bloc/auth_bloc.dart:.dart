import 'dart:async';

import 'package:bloc/bloc.dart';

// Events
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String userId;
  final String password;

  LoginEvent({required this.userId, required this.password});
}

// States
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}

// BLoC
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
