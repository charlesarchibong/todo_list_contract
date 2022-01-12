import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/todo_provider.dart';
import 'package:todolist/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (context) => TodoProvider(),
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
          home: TodoList(),
        );
      },
    );
  }
}
