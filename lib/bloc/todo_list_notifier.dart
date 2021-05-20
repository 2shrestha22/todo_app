import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/service/todo_service.dart';

final todoListNotifierProvider = StateNotifierProvider<TodoList, List<Todo>>(
    (ref) => TodoList(ref.read(todoServiceProvider)));

class TodoList extends StateNotifier<List<Todo>> {
  TodoList(this.todoService) : super(const []) {
    getTodo();
  }
  final TodoService todoService;

  Future<void> createTodo(Todo todo) async {
    await todoService.createTodo(todo);
    state = [...state, todo];
  }

  Future<void> deleteTodo(Todo todo) async {
    await todoService.deleteTodo(todo);
    state = state.where((element) => element != todo).toList();
  }

  Future<void> getTodo() async {
    var todo = await todoService.getTodo();
    state = [...todo];
  }
}
