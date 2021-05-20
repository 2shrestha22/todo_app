import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/todo_form/todo_edit_page.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(),
      ),
    );
  }
}
