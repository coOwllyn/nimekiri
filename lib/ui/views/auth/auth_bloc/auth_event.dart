part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, failure, success }

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UsernameChangedEvent extends AuthEvent {
  const UsernameChangedEvent(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class EmailChangedEvent extends AuthEvent {
  const EmailChangedEvent(this.email);

  final String email;
}

class PasswordChangedEvent extends AuthEvent {
  const PasswordChangedEvent(this.password);

  final String password;
}

class PasswordVisibilityChangedEvent extends AuthEvent {
  const PasswordVisibilityChangedEvent();
}

class SignUpSubmittedEvent extends AuthEvent {
  const SignUpSubmittedEvent();
}

class LoginSubmittedEvent extends AuthEvent {
  const LoginSubmittedEvent();
}

class LoginWithGoogleUser extends AuthEvent {
  const LoginWithGoogleUser();
}

class SignUpWithGoogleUser extends AuthEvent {
  const SignUpWithGoogleUser();
}

class LogOutEvent extends AuthEvent {
  const LogOutEvent();
}
