part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.username = const Username.pure(),
    this.email = '',
    this.password = const Password.pure(),
    this.passwordVisible = false,
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  final Username username;
  final String email;
  final Password password;

  final bool passwordVisible;
  final bool isValid;
  final FormzSubmissionStatus status;

  AuthState copyWith({
    Username? username,
    String? email,
    Password? password,
    bool? passwordVisible,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return AuthState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordVisible: passwordVisible ?? this.passwordVisible,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        username,
        email,
        password,
        passwordVisible,
        isValid,
        status,
      ];
}
