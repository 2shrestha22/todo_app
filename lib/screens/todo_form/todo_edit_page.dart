import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/bloc/todo_list_notifier.dart';
import 'package:todo_app/models/todo.dart';

import '../../constants.dart';

class TodoEditPage extends HookWidget {
  final Todo todo;

  final _golbalKey = GlobalKey<FormState>();

  TodoEditPage(this.todo);

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(todoListNotifierProvider.notifier);

    final titleController = useTextEditingController()..text = todo.title;
    final descriptionController = useTextEditingController()
      ..text = todo.description;
    DateTime dateTime = todo.date;

    final List<String> priorities = ['Low', 'Medium', 'High'];

    _submit() {
      if (_golbalKey.currentState!.validate()) {
        provider.saveTodo(
          todo.copyWith(
            title: titleController.text,
            description: descriptionController.text,
            date: dateTime,
          ),
        );
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title.isEmpty ? 'Create Task' : 'Edit Task'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _golbalKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 5.0,
                          ),
                        ),
                      ),
                      validator: (input) =>
                          input != null && input.trim().isEmpty
                              ? "Please enter a task title"
                              : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 10,
                      controller: descriptionController,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        labelText: "Description",
                        // prefixIcon: Icon(Icons.event_note),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (input) =>
                          input != null && input.trim().isEmpty
                              ? "Please enter a task description"
                              : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DateTimeFormField(
                      initialValue: dateTime,
                      decoration: InputDecoration(
                        labelText: "Time",
                        prefixIcon: Icon(Icons.schedule),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                      ),
                      mode: DateTimeFieldPickerMode.dateAndTime,
                      // autovalidateMode: AutovalidateMode.always,
                      validator: (e) =>
                          (e == null) ? 'Please choose a date' : null,
                      onDateSelected: (DateTime value) {
                        dateTime = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: DropdownButtonFormField(
                          isDense: true,
                          items: priorities.map((String priority) {
                            return DropdownMenuItem(
                                value: priority,
                                child: Text(
                                  priority,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ));
                          }).toList(),
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              labelText: 'Priority',
                              labelStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          // validator: (input) => _priority == null
                          // ? "Please Select a priority level"
                          // : null,
                          // onChanged: (value) {
                          //   setState(
                          //     () {
                          //       _priority = value;
                          //     },
                          //   );
                          // },
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(
                          width: double.infinity, height: 50),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        onPressed: _submit,
                        child: Text('Save'.toUpperCase()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
