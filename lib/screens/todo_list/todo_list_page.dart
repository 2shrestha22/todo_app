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
      body: ListView.separated(
        itemCount: todoList.length,
        padding: kFloatingPadding,
        itemBuilder: (BuildContext context, int index) =>
            DepartmentListItem(context),
        separatorBuilder: (_, __) => const SizedBox(height: kPadding),
      ),
    );
  }

  Widget DepartmentListItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: kShadow,
        color: Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: Container(
          padding: const EdgeInsets.all(kPadding),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Title",
                    style: Constants.title,
                  ),
                  Text(
                    "subtitle",
                    style: Constants.subtitle,
                  ),
                  Text(
                    "date",
                    style: Constants.time,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
