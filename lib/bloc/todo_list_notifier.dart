import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/service/todo_service.dart';

final todoListNotifierProvider =
    StateNotifierProvider((ref) => TodoList(ref.read(todoServiceProvider)));

class TodoList extends StateNotifier<List<Todo>> {
  TodoList(this.todoService) : super(const []);
  final TodoService todoService;

  Future<void> createTodo(Todo todo) async {
    await todoService.createTodo(todo);
    state = [...state, todo];
  }

  Future<List<Todo>> getTodo() async {
    return todoService.getTodo();
  }
}
