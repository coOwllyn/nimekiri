import 'package:todos_api/';

class TodosRepository {
  final TodosApi _todosApi;

  const TodosRepository({
    required TodosApi todosApi,
  }) : _todosApi = todosApi;
}
