import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:todo_bloc/data/manager/network_manager.dart';
import 'package:todo_bloc/data/manager/network_manager_impl.dart';
import 'package:todo_bloc/domain/models/user.dart';
import 'package:todo_bloc/ui/views/auth/models/email.dart';
import 'package:todo_bloc/ui/views/auth/models/password.dart';
import 'package:todo_bloc/ui/views/auth/models/username.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<UsernameChangedEvent>(_onUsernameChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<PasswordVisibilityChangedEvent>(_onPasswordVisibilityChanged);
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
    on<LoginSubmittedEvent>(_onLoginSubmitted);
  }

  void _onUsernameChanged(
    UsernameChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.password]),
    ));
    debugPrint('print username : ${username}');
  }

  void _onPasswordChanged(
    PasswordChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.email]),
    ));
  }

  void _onEmailChanged(
    EmailChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    final email = Email.dirty(event.email);

    emit(state.copyWith(
        email: email, isValid: Formz.validate([email, state.password])));
  }

  void _onPasswordVisibilityChanged(
    PasswordVisibilityChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmittedEvent event,
    Emitter<AuthState> emit,
  ) async {
    // if (state.isValid) {
    emit(state.copyWith(status: AuthStatus.loading));
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password]),
      ),
    );
    debugPrint('user');

    try {
      User user = await networkManager.signUpWithEmailAndPassword(
          state.email.value, state.password.value, state.username.value);
      debugPrint("user email ===================== ${user.email}");

      FirebaseAuth.instance.currentUser;

      emit(
        state.copyWith(
          status: AuthStatus.success,
          receivedUser: user,
        ),
      );
    } catch (e) {
      debugPrint("sign up ============================= $e");
      emit(state.copyWith(
          status: AuthStatus.failure, errorMessage: e.toString()));
    }
    // } else {
    //   emit(state.copyWith(status: AuthStatus.failure));
    //   debugPrint("sign up error");
    // }
  }

  Future<void> _onLoginSubmitted(
    LoginSubmittedEvent event,
    Emitter<AuthState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: AuthStatus.loading));
      final password = Password.dirty(state.password.value);
      emit(
        state.copyWith(
          password: password,
          isValid: Formz.validate([password]),
        ),
      );
      try {
        User user = await networkManager.logInWithEmailAndPassword(
          state.email.value,
          state.password.value,
        );
        debugPrint("user email ===================== ${user.email}");

        FirebaseAuth.instance.currentUser;

        emit(
          state.copyWith(
            status: AuthStatus.success,
            receivedUser: user,
          ),
        );
      } catch (e) {
        debugPrint("login =============================  ${e}");
        emit(state.copyWith(
            status: AuthStatus.failure, errorMessage: e.toString()));
      }
    } else {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }

  NetworkManager networkManager = NetworkManagerImpl();
}
