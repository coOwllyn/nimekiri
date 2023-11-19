import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? userId;
  final String? email;
  final String? userName;

  const User({
    this.userId,
    this.email,
    this.userName,
  });

  factory User.empty() {
    return const User(
      userId: '',
      email: '',
      userName: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': userId,
      'userName': userName,
    };
  }

  factory User.fromMap(Map<String, dynamic> firestore) {
    return User(
      userId: firestore['id'] ?? '',
      email: firestore['email'] ?? '',
      userName: firestore['userName'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        userId,
        email,
        userName,
      ];
}
