import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_bloc/domain/models/user.dart';
import 'package:todo_bloc/ui/views/tasks/bloc/tasks_bloc.dart';

class Task extends Equatable {
  final String taskId;
  final String userId;
  final String title;
  final String description;

  final Timestamp? date;
  final String? startTime;
  final String? endTime;
  final String? priority;
  final String? project;

  final List<DocumentReference> listOfUsers;

  final String? status;

  const Task({
    this.taskId = '',
    this.userId = '',
    this.title = '',
    this.description = '',
    this.date,
    this.startTime,
    this.endTime,
    this.project,
    this.priority,
    this.listOfUsers = const [],
    this.status,
  });

  factory Task.empty() {
    return Task(
      taskId: '',
      userId: '',
      title: '',
      description: '',
      date: Timestamp.now(),
      startTime: '',
      endTime: '',
      project: '',
      priority: '',
      listOfUsers: const [],
      status: TaskStatus.active.name,
    );
  }

  Task copyWith({
    String? title,
    String? description,
    Timestamp? date,
    String? startTime,
    String? endTime,
    String? priority,
    String? project,
    List<String>? listOfUsers,
    String? status,
  }) {
    return Task(
      taskId: taskId,
      userId: userId,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      project: project ?? this.project,
      priority: priority ?? this.priority,
      listOfUsers: [],
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'task_id': taskId,
      'user_id': userId,
      'title': title,
      'description': description,
      'date': date,
      'start_time': startTime,
      'end_time': startTime,
      'project': project,
      'priority': priority,
      'list_of_users': listOfUsers,
      'status': status,
    }..removeWhere((key, value) => value == null);
  }

  bool userInTask(String userId) {
    return listOfUsers.any((ref) => ref.path == 'users/$userId');
  }
  //
  // bool taskInProject(String userId) {
  //   return project.any((ref) => ref.path == 'users/$userId');
  // }

  factory Task.fromMap(Map<String, dynamic> firestore) {
    var task;
    try {
      var usersRefs = firestore['list_of_users'] as List<dynamic>;

      return Task(
        taskId: firestore['task_id'] ?? '',
        userId: firestore['user_id'] ?? '',
        title: firestore['title'] ?? '',
        description: firestore['description'] ?? '',
        date: firestore['date'] ?? Timestamp.now(),
        startTime: firestore['start_time'] ?? '',
        endTime: firestore['end_time'] ?? '',
        project: firestore['project'] ?? '',
        priority: firestore['priority'] ?? '',
        listOfUsers:
            usersRefs.map((mentors) => mentors as DocumentReference).toList(),
        status: firestore['status'] ?? '',
      );
    } catch (e) {
      debugPrint('error task $e');
    }
    return task;
  }

  @override
  List<Object?> get props => [
        taskId,
        userId,
        title,
        description,
        date,
        startTime,
        endTime,
        project,
        priority,
        listOfUsers,
        status,
      ];

  static Future<Task> fromDocumentReference(DocumentReference reference) async {
    final taskDoc = await reference.get();
    return Task.fromMap(taskDoc.data() as Map<String, dynamic>);
  }
}

class TaskDetails extends Equatable {
  final Task task;
  final List<User> users;

  const TaskDetails({
    required this.task,
    required this.users,
  });

  @override
  List<Object?> get props => [task, users];

  static Future<TaskDetails> fromTask(Task task) async {
    final users = await Future.wait(task.listOfUsers
        .map((usersRef) {
          try {
            return User.fromDocumentReference(usersRef);
          } catch (e) {
            debugPrint("task details users error: $e");
            return null;
          }
        })
        .where((users) => users != null)
        .map((e) => e!));

    return TaskDetails(
      task: task,
      users: users,
    );
  }
}
