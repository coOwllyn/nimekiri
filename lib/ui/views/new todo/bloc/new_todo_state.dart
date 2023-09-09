part of 'new_todo_bloc.dart';

enum NewTodoStatus { initial, loading, success, failure }

extension NewTodoStatusX on NewTodoStatus {
  bool get isLoadingOrSuccess => [
        NewTodoStatus.loading,
        NewTodoStatus.success,
      ].contains(this);
}

@immutable
class NewTodoState extends Equatable {
  const NewTodoState({
    this.status = NewTodoStatus.initial,
    this.initialTodo,
    this.title = '',
    this.description = '',
  });

  final NewTodoStatus status;
  final Todo? initialTodo;
  final String title;
  final String description;

  bool get isNewTodo => initialTodo == null;

  NewTodoState copyWith({
    NewTodoStatus? status,
    Todo? initialTodo,
    String? title,
    String? description,
  }) {
    return NewTodoState(
      status: status ?? this.status,
      initialTodo: initialTodo ?? this.initialTodo,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [status, initialTodo, title, description];
}
