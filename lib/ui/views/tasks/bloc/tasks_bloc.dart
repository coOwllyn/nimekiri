import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/domain/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

enum TaskType { pending, favorite, completed }

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<MarkFavoriteOrUnFavoriteTask>(_onMarkFavoriteOrUnFavoriteTask);
    // on<EditTask>(_onEditTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    emit(state.copyWith(pendingTasks: [...state.pendingTasks, event.task]));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    switch (event.taskType) {
      case TaskType.pending:
        emit(state.copyWith(
            pendingTasks: [...state.pendingTasks]
                .where((Task task) => event.task != task)
                .toList()));
        break;
      case TaskType.favorite:
        emit(state.copyWith(
            favoriteTasks: [...state.favoriteTasks]
                .where((Task task) => event.task != task)
                .toList()));
        break;
      case TaskType.completed:
        emit(state.copyWith(
            favoriteTasks: [...state.favoriteTasks]
                .where((Task task) => event.task != task)
                .toList()));
        break;
    }
  }

  void _onMarkFavoriteOrUnFavoriteTask(
      MarkFavoriteOrUnFavoriteTask event, Emitter<TasksState> emit) {
    if (state.favoriteTasks.contains(event.task)) {
      emit(state.copyWith(
          favoriteTasks: [...state.favoriteTasks]
              .where((Task task) => event.task != task)
              .toList()));
    } else {
      emit(state.copyWith(favoriteTasks: [...state.favoriteTasks, event.task]));
    }
  }

  // void _onEditTask(EditTask event, Emitter<TasksState> emit) {
  //   if() {
  //
  //   }
  // }
}
