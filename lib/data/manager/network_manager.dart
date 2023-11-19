import 'package:todo_bloc/domain/models/user.dart';

abstract class NetworkManager {
  Future<User?> logInWithGoogle();
  Future<User> logInWithEmailAndPassword(String email, String password);
  Future<User> signUpWithEmailAndPassword(
      String email, String password, String userName);

  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
}
