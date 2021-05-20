import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/models/todo.dart';

final todoServiceProvider = Provider((ref) => TodoService());

class TodoService {
  final _box = Hive.box(todoBox);

  Future<void> saveTodo(Todo todo) async {
    return _box.put(todo.id, todo.toJson());
  }

  Future<void> deleteTodo(Todo todo) async {
    return _box.delete(todo.id);
  }

  Future<List<Todo>> getTodo() async {
    return _box.values
        .map((e) => Todo.fromJson(e.cast<String, dynamic>()))
        .toList();
  }
}
