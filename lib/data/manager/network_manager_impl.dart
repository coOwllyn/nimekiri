import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_bloc/data/manager/network_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_bloc/domain/models/user.dart';

class NetworkManagerImpl implements NetworkManager {
  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<void> _saveAccessTokenToSharedPreferences({
    required String token,
  }) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(
      tokenKey,
      token,
    );
  }

  static const tokenKey = 'AIzaSyD2__TenHnUudbWZ6DA4g00W7uYODU6UR8';

  @override
  Future<User> logInWithEmailAndPassword(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    var userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .where("id", isEqualTo: userId)
          .get();
      final userData = userDoc.docs.first.data();
      if (userData != null) {
        var user = User.fromMap(userData);
        return user;
      } else {
        throw Exception('Error signing in with email and password');
      }
    } else {
      throw Exception('Error signing in with email and password');
    }
  }

  @override
  Future<User?> logInWithGoogle() async {
    await signOut();
    final googleAccount = await _googleSignIn.signIn();
    if (googleAccount != null) {
      final auth = await googleAccount.authentication;
      final googleAuthAccessToken = auth.accessToken;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuthAccessToken,
        idToken: auth.idToken,
      );
      final userCredential = await FirebaseAuth.instance
          .signInWithCredential(authCredential)
          .catchError((onError) {
        debugPrint('$onError');
      });
      final firebaseAccessToken = userCredential.credential?.accessToken;
      if (firebaseAccessToken != null) {
        _saveAccessTokenToSharedPreferences(
          token: firebaseAccessToken,
        );
      } else {
        await signOut();
        throw Exception('Error signing in with Google');
      }
    }
    return null;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<User> signUpWithEmailAndPassword(
      String email, String password, String userName) async {
    final userCredentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final accessToken = await userCredentials.user?.getIdToken();
    if (accessToken != null) {
      _saveAccessTokenToSharedPreferences(
        token: accessToken,
      );
      final user = User(
          userId: userCredentials.user?.uid,
          email: userCredentials.user?.email,
          userName: userName);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.userId)
          .set(user.toMap());
      return user;
    } else {
      throw Exception('Error signing in with email and password');
    }
  }
}
