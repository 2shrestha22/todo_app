import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    required DateTime date,
    // required TimeOfDay time,
    required String description,
    required bool completed,
  }) = _Todo;

  factory Todo.empty() => Todo(
        id: Uuid().v4(),
        title: '',
        date: DateTime.now(),
        // time: TimeOfDay.now(),
        description: '',
        completed: false,
      );

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
