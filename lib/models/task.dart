import 'package:uuid/uuid.dart';

class Task {
  final String id = const Uuid().v4();
  final String name;
  bool concluido;

  Task({required this.name, required this.concluido});
}