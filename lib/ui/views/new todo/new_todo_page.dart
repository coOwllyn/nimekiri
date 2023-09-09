import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/data/model/todo.dart';
import 'package:todo_bloc/data/todos_repository.dart';
import 'package:todo_bloc/ui/views/new%20todo/bloc/new_todo_bloc.dart';
import 'package:todo_bloc/ui/views/new%20todo/new_todo_form.dart';

class NewTodoPage extends StatelessWidget {
  const NewTodoPage({super.key});

  static Route<void> route({Todo? initialTodo}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => NewTodoBloc(
          todosRepository: context.read<TodosRepository>(),
          initialTodo: initialTodo,
        ),
        child: const NewTodoPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewTodoBloc, NewTodoState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == NewTodoStatus.success,
      listener: (context, state) => Navigator.of(context).pop(),
      child: NewTodoForm(),
    );
  }
}
