part of 'user_bloc.dart';

class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class LoadUser extends UserEvent {
  const LoadUser(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}

class LogOutUser extends UserEvent {
  const LogOutUser();

  @override
  List<Object> get props => [];
}

class GetInitialUser extends UserEvent {
  const GetInitialUser();

  @override
  List<Object> get props => [];
}
