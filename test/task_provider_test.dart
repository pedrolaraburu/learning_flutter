import 'package:learning_flutter2/models/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter2/provider/task_provider.dart';

void main() {
  group('TaskProvider', () {
    test('Check if TaskProvider initializes empty', () {
      final taskProvider = TaskProvider(tasks: []);
      expect(taskProvider.tasks.length, 0);
    });

    test('Add a task to the list', () {
      final taskProvider = TaskProvider(tasks: []);
      final task = Task(name: 'test', concluido: false);
      taskProvider.addTask(task);
      expect(taskProvider.tasks.length, 1);
    });

    test('Remove a task from the list', () {
      final taskProvider = TaskProvider(tasks: []);
      final task = Task(name: 'test', concluido: false);
      taskProvider.addTask(task);
      taskProvider.removeTask(task);
      expect(taskProvider.tasks.length, 0);
    });

    test('After adding a task, check the checkbox value', () {
      final taskProvider = TaskProvider(tasks: []);
      final task = Task(name: 'test', concluido: false);
      taskProvider.addTask(task);
      taskProvider.toggleTask(task);
      expect(taskProvider.tasks[0].concluido, true);
      taskProvider.toggleTask(task);
      expect(taskProvider.tasks[0].concluido, false);
    });
  });
}