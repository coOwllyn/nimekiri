part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.passwordVisible = false,
    this.isValid = false,
    this.status = AuthStatus.initial,
    this.receivedUser,
    this.errorMessage,
  });

  final Username username;
  final Email email;
  final Password password;

  final bool passwordVisible;
  final bool isValid;
  final AuthStatus status;

  final User? receivedUser;
  final String? errorMessage;

  AuthState copyWith({
    Username? username,
    Email? email,
    Password? password,
    bool? passwordVisible,
    bool? isValid,
    AuthStatus? status,
    User? receivedUser,
    String? errorMessage,
  }) {
    return AuthState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordVisible: passwordVisible ?? this.passwordVisible,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      receivedUser: receivedUser ?? this.receivedUser,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        username,
        email,
        password,
        passwordVisible,
        isValid,
        status,
        receivedUser,
        errorMessage,
      ];
}
