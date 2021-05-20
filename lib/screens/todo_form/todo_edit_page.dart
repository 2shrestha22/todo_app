import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/bloc/todo_list_notifier.dart';
import 'package:todo_app/models/todo.dart';

import '../../constants.dart';

class TodoEditPage extends HookWidget {
  final Todo todo;
  DateTime _date = DateTime.now();
  final DateFormat _dateFormat = DateFormat('MMM dd, yyyy');

  final _golbalKey = GlobalKey<FormState>();

  TodoEditPage(this.todo);

  //  _handleDatePicker() async {
  //   final DateTime date = await showDatePicker(
  //       context: context,
  //       initialDate: _date,
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2100));
  //   if (date != null && date != _date) {
  //     setState(() {
  //       _date = date;
  //     });
  //     _dateController.text = _dateFormat.format(date);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(todoListNotifierProvider.notifier);

    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    _submit() {
      if (_golbalKey.currentState!.validate()) {
        _golbalKey.currentState!.save();
        provider.createTodo(
          todo.copyWith(
              title: titleController.text,
              description: descriptionController.text),
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
                        ),
                      ),
                      validator: (input) =>
                          input != null && input.trim().isEmpty
                              ? "Please enter a task title"
                              : null,
                      // onSaved: (input) => _title = input,
                      // initialValue: _title,
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
                        ),
                      ),
                      validator: (input) =>
                          input != null && input.trim().isEmpty
                              ? "Please enter a task description"
                              : null,
                      // onSaved: (input) => _description = input,
                      // initialValue: _description,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: _dateController,
                      readOnly: true,
                      // onTap: _handleDatePicker,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today_outlined),
                        labelText: "Date",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: _timeController,
                      readOnly: true,
                      // onTap: _handleTimePicker,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.timer_sharp),
                        labelText: "time",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
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
