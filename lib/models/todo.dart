import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

enum TodoPriority {
  low,
  medium,
  high,
}

extension TodoPriorityX on TodoPriority {
  String get toNiceString => describeEnum(this);
}

@freezed
class Todo with _$Todo {
  /// id is null for empty note
  /// id is assigned by database auto increment key
  const factory Todo({
    int? id,
    required String title,
    required DateTime date,
    // required TimeOfDay time,
    required String description,
    required bool completed,
    required TodoPriority priority,
  }) = _Todo;

  factory Todo.empty() => Todo(
        title: '',
        date: DateTime.now(),
        // time: TimeOfDay.now(),
        description: '',
        completed: false,
        priority: TodoPriority.low,
      );

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
