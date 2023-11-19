part of 'user_bloc.dart';

enum UserStatus { initial, loading, failure, loggedIn, notLoggedIn }

@immutable
class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.initial,
    this.user,
  });

  final UserStatus status;
  final User? user;

  UserState copyWith({
    UserStatus? status,
    User? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, user];
}
