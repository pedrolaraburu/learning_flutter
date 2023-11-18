// Can you create the TaskProvider test class?

import 'package:learning_flutter2/models/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter2/provider/task_provider.dart';

void main() {
  group('TaskProvider', () {
    test('testInitialLength', () {
      final taskProvider = TaskProvider(tasks: []);
      expect(taskProvider.tasks.length, 0);
    });

    test('addTask', () {
      final taskProvider = TaskProvider(tasks: []);
      final task = Task(name: 'test', id: '123', concluido: false);
      taskProvider.addTask(task);
      expect(taskProvider.tasks.length, 1);
    });

    test('removeTask', () {
      final taskProvider = TaskProvider(tasks: []);
      final task = Task(name: 'test', id: '123', concluido: false);
      taskProvider.addTask(task);
      taskProvider.removeTask(task);
      expect(taskProvider.tasks.length, 0);
    });

    test('toggleIsDone', () {
      final taskProvider = TaskProvider(tasks: []);
      final task = Task(name: 'test', id: '123', concluido: false);
      taskProvider.addTask(task);
      taskProvider.toggleTask(task);
      expect(taskProvider.tasks[0].concluido, true);
      taskProvider.toggleTask(task);
      expect(taskProvider.tasks[0].concluido, false);
    });
  });
}