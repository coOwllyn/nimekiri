import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/domain/models/project.dart';
import 'package:todo_bloc/domain/models/task.dart';

class User extends Equatable {
  final String userId;
  final String email;
  final String userName;

  final String? location;
  final String? jobTitle;

  final List<DocumentReference> listOfTasks;
  final List<DocumentReference> listOfProjects;

  const User({
    this.userId = '',
    this.email = '',
    this.userName = '',
    this.location,
    this.jobTitle,
    this.listOfTasks = const [],
    this.listOfProjects = const [],
  });

  factory User.empty() {
    return const User(
      userId: '',
      email: '',
      userName: '',
      location: '',
      jobTitle: '',
      listOfTasks: [],
      listOfProjects: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'email': email,
      'user_name': userName,
      'location': location,
      'job_title': jobTitle,
      'list_of_tasks': listOfTasks,
      'list_of_projects': listOfProjects,
    }..removeWhere((key, value) => value == null);
  }

  factory User.fromMap(Map<String, dynamic> firestore) {
    return User(
      userId: firestore['user_id'] ?? '',
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

  static Future<User> fromDocumentReference(DocumentReference reference) async {
    final userDoc = await reference.get();
    return User.fromMap(userDoc.data() as Map<String, dynamic>);
  }
}

class UserDetails extends Equatable {
  final User user;
  final List<Task> tasks;
  final List<Project> projects;

  const UserDetails({
    required this.user,
    required this.tasks,
    required this.projects,
  });

  @override
  List<Object?> get props => [user, tasks, projects];

  static Future<UserDetails> fromUser(User user) async {
    final tasks = await Future.wait(user.listOfTasks
        .map((tasksRef) {
          try {
            return Task.fromDocumentReference(tasksRef);
          } catch (e) {
            debugPrint("user details tasks error: $e");
            return null;
          }
        })
        .where((tasks) => tasks != null)
        .map((e) => e!));

    final projects = await Future.wait(user.listOfProjects
        .map((projectsRef) {
          try {
            return Project.fromDocumentReference(projectsRef);
          } catch (e) {
            debugPrint("user details projects error: $e");
            return null;
          }
        })
        .where((projects) => projects != null)
        .map((e) => e!));

    return UserDetails(
      user: user,
      tasks: tasks,
      projects: projects,
    );
  }
}
