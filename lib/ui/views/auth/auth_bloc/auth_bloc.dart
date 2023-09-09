import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc/ui/views/auth/models/password.dart';
import 'package:todo_bloc/ui/views/auth/models/username.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<UsernameChangedEvent>(_onUsernameChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<PasswordVisibilityChangedEvent>(_onPasswordVisibilityChanged);
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
  }

  void _onUsernameChanged(UsernameChangedEvent event, Emitter<AuthState> emit) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
        username: username, isValid: Formz.validate([username])));
  }

  void _onEmailChanged(EmailChangedEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<AuthState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
        password: password, isValid: Formz.validate([password])));
  }

  void _onPasswordVisibilityChanged(
      PasswordVisibilityChangedEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmittedEvent event,
    Emitter<AuthState> emit,
  ) async {
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
  }
}
