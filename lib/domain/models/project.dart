import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_bloc/domain/models/task.dart';
import 'package:todo_bloc/domain/models/user.dart';
import 'package:todo_bloc/ui/views/projects/bloc/projects_bloc.dart';

class Project extends Equatable {
  final String projectId;
  final String userId;
  final String title;
  final String description;

  final Timestamp? startDate;
  final Timestamp? endDate;
  final String? startTime;
  final String? endTime;
  final String? priority;

  final List<DocumentReference> listOfUsers;
  final List<DocumentReference> listOfTasks;

  final String? status;

  const Project({
    this.projectId = '',
    this.userId = '',
    this.title = '',
    this.description = '',
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.priority,
    this.listOfUsers = const [],
    this.listOfTasks = const [],
    this.status,
  });

  factory Project.empty() {
    return Project(
      projectId: '',
      userId: '',
      title: '',
      description: '',
      startDate: Timestamp.now(),
      endDate: Timestamp.now(),
      startTime: '',
      endTime: '',
      priority: '',
      listOfUsers: const [],
      listOfTasks: const [],
      status: ProjectStatus.active.name,
    );
  }

  Project copyWith({
    String? title,
    String? description,
    Timestamp? startDate,
    Timestamp? endDate,
    String? startTime,
    String? endTime,
    String? priority,
    List<String>? listOfUsers,
    List<String>? listOfTasks,
    String? status,
  }) {
    return Project(
      projectId: projectId,
      userId: userId,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      priority: priority ?? this.priority,
      listOfUsers: [],
      listOfTasks: [],
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'task_id': projectId,
      'user_id': userId,
      'title': title,
      'description': description,
      'start_date': startDate,
      'end_date': endDate,
      'start_time': startTime,
      'end_time': startTime,
      'priority': priority,
      'list_of_users': listOfUsers,
      'list_of_tasks': listOfTasks,
      'status': status,
    }..removeWhere((key, value) => value == null);
  }

  bool userInProject(String userId) {
    return listOfUsers.any((ref) => ref.path == 'users/$userId');
  }

  factory Project.fromMap(Map<String, dynamic> firestore) {
    var task;
    try {
      var usersRefs = firestore['list_of_users'] as List<dynamic>;
      var tasksRefs = firestore['list_of_tasks'] as List<dynamic>;

      return Project(
        projectId: firestore['task_id'] ?? '',
        userId: firestore['user_id'] ?? '',
        title: firestore['title'] ?? '',
        description: firestore['description'] ?? '',
        startDate: firestore['start_date'] ?? Timestamp.now(),
        endDate: firestore['end_date'] ?? Timestamp.now(),
        startTime: firestore['start_time'] ?? '',
        endTime: firestore['end_time'] ?? '',
        priority: firestore['priority'] ?? '',
        listOfUsers:
            usersRefs.map((users) => users as DocumentReference).toList(),
        listOfTasks:
            tasksRefs.map((tasks) => tasks as DocumentReference).toList(),
        status: firestore['status'] ?? '',
      );
    } catch (e) {
      debugPrint('error project $e');
    }
    return task;
  }

  @override
  List<Object?> get props => [
        projectId,
        userId,
        title,
        description,
        startDate,
        endDate,
        startTime,
        endTime,
        priority,
        listOfUsers,
        listOfTasks,
        status,
      ];

  static Future<Project> fromDocumentReference(
      DocumentReference reference) async {
    final projectDoc = await reference.get();
    return Project.fromMap(projectDoc.data() as Map<String, dynamic>);
  }
}

class ProjectDetails extends Equatable {
  final Project project;
  final List<User> users;
  final List<Task> tasks;

  const ProjectDetails({
    required this.project,
    required this.users,
    required this.tasks,
  });

  @override
  List<Object?> get props => [project, tasks, users];

  static Future<ProjectDetails> fromProject(Project project) async {
    final users = await Future.wait(project.listOfUsers
        .map((usersRef) {
          try {
            return User.fromDocumentReference(usersRef);
          } catch (e) {
            debugPrint("project details users error: $e");
            return null;
          }
        })
        .where((users) => users != null)
        .map((e) => e!));

    final tasks = await Future.wait(project.listOfUsers
        .map((tasksRef) {
          try {
            return Task.fromDocumentReference(tasksRef);
          } catch (e) {
            debugPrint("project details tasks error: $e");
            return null;
          }
        })
        .where((tasks) => tasks != null)
        .map((e) => e!));

    return ProjectDetails(
      project: project,
      users: users,
      tasks: tasks,
    );
  }
}
