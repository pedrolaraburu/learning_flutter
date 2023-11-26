import 'package:flutter/material.dart';
import 'package:learning_flutter2/models/task.dart';
import 'package:learning_flutter2/provider/task_provider.dart';
import 'package:learning_flutter2/screens/form_screen.dart';
import 'package:learning_flutter2/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TaskProvider(tasks: [Task(name: 'Task demo 1', concluido: false)]);
        })],
      child: MaterialApp(
        routes: {
          '/': (context) => const TaskScreen(),
          '/form': (context) => const FormScreen(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Colors.amber,
          ),
        ),
      ),
    );
  }
}