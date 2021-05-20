import 'package:date_time_picker/date_time_picker.dart';
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

    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final timeController = useTextEditingController();

    _submit() {
      if (_golbalKey.currentState!.validate()) {
        // _golbalKey.currentState!.save();
        provider.createTodo(
          todo.copyWith(
            title: titleController.text,
            description: descriptionController.text,
            date: DateTime.tryParse(timeController.text) ?? DateTime.now(),
          ),
        );
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Task"),
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
                      controller: descriptionController,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        labelText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(
                            color: Colors.white,
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
                    DateTimePicker(
                      controller: timeController,
                      use24HourFormat: false,
                      type: DateTimePickerType.dateTimeSeparate,
                      dateMask: 'd MMM, yyyy',
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      icon: Icon(Icons.event),
                      dateLabelText: 'Date',
                      timeLabelText: "Hour",
                      validator: (input) =>
                          input != null && input.trim().isEmpty
                              ? "Please pick a time"
                              : null,
                      onSaved: (val) => print(val),
                    ),
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
