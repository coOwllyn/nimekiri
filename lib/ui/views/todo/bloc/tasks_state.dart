part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  const TasksState({
    this.pendingTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    // this.task = '',
  });

  // final String task;

  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;

  TasksState copyWith({
    // Task? task,
    List<Task>? pendingTasks,
    List<Task>? completedTasks,
    List<Task>? favoriteTasks,
  }) {
    return TasksState(
        // task: task ?? this.task,
        pendingTasks: pendingTasks ?? this.pendingTasks,
        completedTasks: completedTasks ?? this.completedTasks,
        favoriteTasks: favoriteTasks ?? this.favoriteTasks);
  }

  @override
  List<Object> get props => [
        pendingTasks,
        completedTasks,
        favoriteTasks,
      ];

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
  //     'completedTasks': pendingTasks.map((x) => x.toMap()).toList(),
  //     'favoriteTasks': pendingTasks.map((x) => x.toMap()).toList(),
  //   };
  // }
  //
  // factory TasksState.fromMap(Map<String, dynamic> map) {
  //   return TasksState(
  //     pendingTasks: List<Task>.from(
  //       (map['pendingTasks'])?.map<Task>(
  //         (x) => Task.fromMap(x),
  //       ),
  //     ),
  //     completedTasks: List<Task>.from(
  //       (map['completedTasks'])?.map<Task>(
  //         (x) => Task.fromMap(x),
  //       ),
  //     ),
  //     favoriteTasks: List<Task>.from(
  //       (map['favoriteTasks'])?.map<Task>(
  //         (x) => Task.fromMap(x),
  //       ),
  //     ),
  //
  //   );
  // }
}
