import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc/data/model/todo.dart';
import 'package:todo_bloc/data/todos_repository.dart';

part 'new_todo_event.dart';
part 'new_todo_state.dart';

class NewTodoBloc extends Bloc<NewTodoEvent, NewTodoState> {
  NewTodoBloc({
    required TodosRepository todosRepository,
    required Todo? initialTodo,
  })  : _todosRepository = todosRepository,
        super(NewTodoState(
          initialTodo: initialTodo,
          title: initialTodo?.title ?? '',
          description: initialTodo?.description ?? '',
        )) {
    on<NewTodoTitleChanged>(_onTitleChanged);
    on<NewTodoDescriptionChanged>(_onDescriptionChanged);
    on<NewTodoSubmitted>(_onSubmitted);
  }

  final TodosRepository _todosRepository;

  void _onTitleChanged(
    NewTodoTitleChanged event,
    Emitter<NewTodoState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onDescriptionChanged(
    NewTodoDescriptionChanged event,
    Emitter<NewTodoState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  Future<void> _onSubmitted(
    NewTodoSubmitted event,
    Emitter<NewTodoState> emit,
  ) async {
    emit(state.copyWith(status: NewTodoStatus.loading));
    final todo = (state.initialTodo ?? Todo(title: '')).copyWith(
      title: state.title,
      description: state.description,
    );

    try {
      await _todosRepository.saveTodo(todo);
      emit(state.copyWith(status: NewTodoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: NewTodoStatus.failure));
    }
  }
}
