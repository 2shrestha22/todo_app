import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/intro/onboarding_screens.dart';
import 'package:todo_app/screens/todo_list/todo_list_page.dart';

late int intro;
Future<void> main() async {
  await Hive.initFlutter();
  await Future.wait([
    Hive.openBox(todoBox),
    Hive.openBox(introBox),
  ]);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'Reminder App',
      debugShowCheckedModeBanner: false,
      initialRoute:
          Hive.box(introBox).get('intro', defaultValue: true) ? 'onboard' : '/',
      routes: {
        '/': (context) => TodoListPage(),
        'onboard': (context) => OnboardingPage(),
        'editTodo': (context) => TodoListPage(),
      },
      theme: ThemeData(primaryColor: primaryColor
          // primarySwatch: Colors.blue,
          ),
    );
  }
}
