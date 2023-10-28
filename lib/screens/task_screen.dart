import 'package:flutter/material.dart';
import 'package:learning_flutter2/provider/task_provider.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import 'package:uuid/uuid.dart';
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 35, bottom: 20),
              child: const Text('Tasks'),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _textController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<TaskProvider>(context, listen: false).addTask(
                        Task(name: _textController.text, id: const Uuid().v4()),
                    );
                      _textController.clear();
                      },
                    child: const Text('Save'),
                  ),
                  Consumer<TaskProvider>(builder: (context, TaskProvider taskProvider, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(taskProvider.tasks[index].name),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => Provider.of<TaskProvider>(context, listen: false).removeTask(taskProvider.tasks[index])
                          ),
                        );
                      },
                    );
                  },),
                ],
              ),
              )
          ],
        ),
        ),
      );
  }
}
