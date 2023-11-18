import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter2/models/task.dart';
import 'package:learning_flutter2/provider/task_provider.dart';
import 'package:learning_flutter2/screens/task_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'mock_task_provider.mocks.dart';

@GenerateMocks([TaskProvider])
void main () {

  testWidgets("Verifica se lista inicializa com uma task e se não está concluída", (WidgetTester tester) async {
    final mockTaskProvider = MockTaskProvider();
    when(mockTaskProvider.tasks).thenReturn([Task(name: 'test', id: '123', concluido: false)]);

    Widget app = MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(create: (context) => mockTaskProvider)
      ],
      child: const MaterialApp(
        home: TaskScreen(),
      ), 
    );
    await tester.pumpWidget(app);

    expect(find.text("test"), findsOneWidget);
    expect(find.byIcon(Icons.delete), findsOneWidget);
    var checkbox = tester.firstWidget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.value, isFalse); 
  });

  testWidgets("Verifica se lista inicializa com uma task e se está concluida", (WidgetTester tester) async {
    final mockTaskProvider = MockTaskProvider();
    when(mockTaskProvider.tasks).thenReturn([Task(name: 'test', id: '123', concluido: true)]);

    Widget app = MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(create: (context) => mockTaskProvider)
      ],
      child: const MaterialApp(
        home: TaskScreen(),
      ),
    );
    await tester.pumpWidget(app);

    expect(find.text("test"), findsOneWidget);
    expect(find.byIcon(Icons.delete), findsOneWidget);
    var checkbox = tester.firstWidget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.value, isTrue); 
  });
}