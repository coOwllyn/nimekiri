part of 'new_todo_bloc.dart';

@immutable
abstract class NewTodoEvent extends Equatable {
  const NewTodoEvent();

  @override
  List<Object> get props => [];
}

class NewTodoTitleChanged extends NewTodoEvent {
  const NewTodoTitleChanged(this.title);

  final String title;

  @override
  List<Object> get props => [title];
}

class NewTodoDescriptionChanged extends NewTodoEvent {
  const NewTodoDescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class NewTodoSubmitted extends NewTodoEvent {
  const NewTodoSubmitted();
}
