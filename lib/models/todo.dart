import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'todo.freezed.dart';
part 'todo.g.dart';

@HiveType(typeId: 2)
enum TodoPriority {
  @HiveField(0)
  low,
  @HiveField(1)
  medium,
  @HiveField(2)
  high,
}

extension TodoPriorityX on TodoPriority {
  String get toNiceString => describeEnum(this);
}

@freezed
@HiveType(typeId: 1)
class Todo extends HiveObject with _$Todo {
  /// id is null for empty note
  /// id is assigned by database auto increment key
  Todo._();
  factory Todo({
    @HiveField(1) required String title,
    @HiveField(2) required DateTime date,
    // required TimeOfDay time,
    @HiveField(3) required String description,
    @HiveField(4) required bool completed,
    @HiveField(5) required TodoPriority priority,
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
