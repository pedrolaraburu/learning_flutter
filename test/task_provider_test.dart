// Can you create the TaskProvider test class?

import 'package:learning_flutter2/models/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter2/provider/task_provider.dart';

void main() {
  group('TaskProvider', () {
    test('addTask', () {
      final taskProvider = TaskProvider();
      final task = Task(name: 'test', id: '123');
      taskProvider.addTask(task);
      expect(taskProvider.tasks.length, 1);
    });
    test('removeTask', () {
      final taskProvider = TaskProvider();
      final task = Task(name: 'test', id: '123');
      taskProvider.addTask(task);
      taskProvider.removeTask(task);
      expect(taskProvider.tasks.length, 0);
    });
  });
}