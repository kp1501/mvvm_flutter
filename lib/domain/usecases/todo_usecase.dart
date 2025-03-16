import '../repositories/todo_repository.dart';
import '../entities/todo_entity.dart';

class FetchTodosUseCase {
  final TodoRepository repository;

  FetchTodosUseCase(this.repository);

  Future<List<TodoEntity>> call() => repository.fetchTodos();
}
