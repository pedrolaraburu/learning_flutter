import 'package:flutter/material.dart';
import 'package:learning_flutter2/models/task.dart';
import 'package:learning_flutter2/provider/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Screen')
      ),
      body: Center(
        child: SingleChildScrollView(
        child: Container(
          height: 650, 
          width: 375, 
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white70,
              width: 3,
            )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                    fillColor: Colors.white70,
                    filled: true
                  ),
                ),
              ),
              Consumer<TaskProvider>(
                builder: (context, TaskProvider taskProvider, child) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Provider.of<TaskProvider>(context, listen: false).addTask(
                        Task(name: nameController.text, id: const Uuid().v4(), concluido: false),
                      );
                      nameController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tarefa adicionada com sucesso!')),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Salvar'),
                  );
                },
              ),
            ],
          ))
      ),)
    ));
  }
}