// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

/// @nodoc
class _$TodoTearOff {
  const _$TodoTearOff();

  _Todo call(
      {@HiveField(1) required String title,
      @HiveField(2) required DateTime date,
      @HiveField(3) required String description,
      @HiveField(4) required bool completed,
      @HiveField(5) required TodoPriority priority}) {
    return _Todo(
      title: title,
      date: date,
      description: description,
      completed: completed,
      priority: priority,
    );
  }

  Todo fromJson(Map<String, Object> json) {
    return Todo.fromJson(json);
  }
}

/// @nodoc
const $Todo = _$TodoTearOff();

/// @nodoc
mixin _$Todo {
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get date =>
      throw _privateConstructorUsedError; // required TimeOfDay time,
  @HiveField(3)
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get completed => throw _privateConstructorUsedError;
  @HiveField(5)
  TodoPriority get priority => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1) String title,
      @HiveField(2) DateTime date,
      @HiveField(3) String description,
      @HiveField(4) bool completed,
      @HiveField(5) TodoPriority priority});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? date = freezed,
    Object? description = freezed,
    Object? completed = freezed,
    Object? priority = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TodoPriority,
    ));
  }
}

/// @nodoc
abstract class _$TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$TodoCopyWith(_Todo value, $Res Function(_Todo) then) =
      __$TodoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1) String title,
      @HiveField(2) DateTime date,
      @HiveField(3) String description,
      @HiveField(4) bool completed,
      @HiveField(5) TodoPriority priority});
}

/// @nodoc
class __$TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements _$TodoCopyWith<$Res> {
  __$TodoCopyWithImpl(_Todo _value, $Res Function(_Todo) _then)
      : super(_value, (v) => _then(v as _Todo));

  @override
  _Todo get _value => super._value as _Todo;

  @override
  $Res call({
    Object? title = freezed,
    Object? date = freezed,
    Object? description = freezed,
    Object? completed = freezed,
    Object? priority = freezed,
  }) {
    return _then(_Todo(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TodoPriority,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Todo extends _Todo with DiagnosticableTreeMixin {
  _$_Todo(
      {@HiveField(1) required this.title,
      @HiveField(2) required this.date,
      @HiveField(3) required this.description,
      @HiveField(4) required this.completed,
      @HiveField(5) required this.priority})
      : super._();

  factory _$_Todo.fromJson(Map<String, dynamic> json) =>
      _$_$_TodoFromJson(json);

  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final DateTime date;
  @override // required TimeOfDay time,
  @HiveField(3)
  final String description;
  @override
  @HiveField(4)
  final bool completed;
  @override
  @HiveField(5)
  final TodoPriority priority;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(title: $title, date: $date, description: $description, completed: $completed, priority: $priority)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('completed', completed))
      ..add(DiagnosticsProperty('priority', priority));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Todo &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.completed, completed) ||
                const DeepCollectionEquality()
                    .equals(other.completed, completed)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(completed) ^
      const DeepCollectionEquality().hash(priority);

  @JsonKey(ignore: true)
  @override
  _$TodoCopyWith<_Todo> get copyWith =>
      __$TodoCopyWithImpl<_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TodoToJson(this);
  }
}

abstract class _Todo extends Todo {
  factory _Todo(
      {@HiveField(1) required String title,
      @HiveField(2) required DateTime date,
      @HiveField(3) required String description,
      @HiveField(4) required bool completed,
      @HiveField(5) required TodoPriority priority}) = _$_Todo;
  _Todo._() : super._();

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  DateTime get date => throw _privateConstructorUsedError;
  @override // required TimeOfDay time,
  @HiveField(3)
  String get description => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  bool get completed => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  TodoPriority get priority => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TodoCopyWith<_Todo> get copyWith => throw _privateConstructorUsedError;
}
