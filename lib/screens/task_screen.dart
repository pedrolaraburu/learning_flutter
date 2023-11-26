import 'package:flutter/material.dart';
import 'package:learning_flutter2/provider/task_provider.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        leading: const Icon(Icons.menu),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, TaskProvider taskProvider, child) {
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return ListTile(
                title: Text(task.name),
                trailing: Wrap(
                  spacing: 12,
                  children: <Widget>[
                    Checkbox(
                      key: ValueKey('checkbox-${task.id}'),
                      value: task.concluido,
                      onChanged: (value) {
                        Provider.of<TaskProvider>(context, listen: false).toggleTask(task);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => Provider.of<TaskProvider>(context, listen: false).removeTask(task),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/form');
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
