import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  TaskProvider({required this.tasks});
  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.concluido = !task.concluido;
    notifyListeners();
  }
}