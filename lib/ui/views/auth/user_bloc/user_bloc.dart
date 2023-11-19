import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc/data/manager/network_manager.dart';
import 'package:todo_bloc/data/manager/network_manager_impl.dart';
import 'package:todo_bloc/domain/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState(user: null)) {
    on<GetInitialUser>(_onGetInitialUser);
    on<LoadUser>(_onLoadUser);
    on<LogOutUser>(_onLogOutUser);
  }

  void _onLoadUser(
    LoadUser event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      emit(state.copyWith(status: UserStatus.loggedIn, user: event.user));
    } catch (e) {
      debugPrint("user error: $e");
      emit(state.copyWith(status: UserStatus.failure));
    }
  }

  Future<void> _onLogOutUser(
    LogOutUser event,
    Emitter<UserState> emit,
  ) async {
    try {
      // await databaseManager.logOut();
      await networkManager.signOut();
    } catch (e) {
      debugPrint('$e');
    }
  }

  void _onGetInitialUser(
    GetInitialUser event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      debugPrint("USER ID =================== $userId");
      if (userId != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .where("id", isEqualTo: userId)
            .get();
        if (userDoc.docs.isNotEmpty) {
          final userData = userDoc.docs.first.data();
          debugPrint("userData ============ ${userData.toString()}");
          final user = User.fromMap(userData);
          emit(state.copyWith(
            user: user,
            status: UserStatus.loggedIn,
          ));
          return;
        }
      }
      return;
    } catch (e) {
      debugPrint("user error: $e");
      emit(state.copyWith(status: UserStatus.failure));
    }
  }

  NetworkManager networkManager = NetworkManagerImpl();
}
