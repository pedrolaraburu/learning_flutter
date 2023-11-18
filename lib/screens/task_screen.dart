import 'package:flutter/material.dart';
import 'package:learning_flutter2/provider/task_provider.dart';
import 'package:provider/provider.dart';
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Screen'),
        leading: const Icon(Icons.menu),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 35, bottom: 20),
              child: const Text('Tasks'),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Consumer<TaskProvider>(
                      builder: (context, TaskProvider taskProvider, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: taskProvider.tasks.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(taskProvider.tasks[index].name),
                              trailing: 
                              Wrap(spacing: 12,
                              children: <Widget>[
                                Checkbox(
                                  value: taskProvider.tasks[index].concluido,
                                  onChanged: (value) {
                                    Provider.of<TaskProvider>(context, listen: false).toggleTask(taskProvider.tasks[index]);
                                },
                              ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => Provider.of<TaskProvider>(context, listen: false).removeTask(taskProvider.tasks[index])
                              ),
                              ],
                              ) 
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              )
          ],
        ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/form');
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        )
      );
  }
}
