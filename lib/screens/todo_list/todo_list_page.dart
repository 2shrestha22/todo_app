import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/bloc/todo_list_notifier.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/todo_form/todo_edit_page.dart';

class TodoListPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = useProvider(todoListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TodoEditPage(Todo.empty()),
          ),
        ),
        label: Text("Create Events"),
        icon: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) => TodoListItem(todo: todoList[index]),
      ),
    );
  }
}

class TodoListItem extends HookWidget {
  final Todo todo;

  const TodoListItem({Key? key, required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final todoList = useProvider(todoListNotifierProvider.notifier);

    return InkWell(
      onTap: () {},
      child: ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
          trailing: Checkbox(
            value: todo.completed,
            onChanged: (value) =>
                todoList.updateTodo(todo.copyWith(completed: value!)),
          )),
    );
  }
}
