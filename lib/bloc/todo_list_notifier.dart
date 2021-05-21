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

  Future<void> saveTodo(Todo todo) async {
    await todoService.saveTodo(todo);
    return getTodo();
  }

  // Future<void> createTodo(Todo todo) async {
  //   state = [...state, todo];
  //   return todoService.saveTodo(todo);
  // }

  // Future<void> updateTodo(Todo updatedTodo) async {
  //   state = [
  //     for (final item in state)
  //       if (item.id == updatedTodo.id) updatedTodo else item,
  //   ];
  //   return todoService.saveTodo(updatedTodo);
  // }

  Future<void> deleteTodo(Todo todo) async {
    await todoService.deleteTodo(todo);
    state = state.where((element) => element != todo).toList();
  }

  Future<void> getTodo() async {
    var todo = await todoService.getTodo();
    todo.sort((a, b) => a.date.compareTo(b.date));
    state = [...todo];
  }
}
