import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
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
      body: ListView.separated(
        itemCount: todoList.length,
        itemBuilder: (context, index) => TodoListItem(todo: todoList[index]),
        separatorBuilder: (_, __) => const SizedBox(height: kPadding),
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

    return Dismissible(
      key: Key(todo.id), // it should be unique
      background: Container(
        color: primaryColor,
      ),
      onDismissed: (direction) async {
        await todoList.deleteTodo(todo);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('List Removed')));
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          boxShadow: kShadow,
          color: Colors.white,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: ListTile(
            title: Row(
              children: [
                Text(
                  todo.title,
                  style: Constants.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.description,
                  style: Constants.subtitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  DateFormat.yMMMMEEEEd().add_jm().format(todo.date),
                  style: Constants.time,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            trailing: Checkbox(
              value: todo.completed,
              onChanged: (value) => todoList.updateTodo(
                todo.copyWith(
                  completed: value!,
                ),
              ),
            )),
      ),
    );
  }
}
