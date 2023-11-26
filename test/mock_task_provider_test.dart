import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter2/models/task.dart';
import 'package:learning_flutter2/provider/task_provider.dart';
import 'package:learning_flutter2/screens/task_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import './mock_task_provider_test.mocks.dart';

@GenerateMocks([TaskProvider])
void main () {

  testWidgets("Test 1 - Verify if the list initializes correctly and checkbox value is False", (WidgetTester tester) async {
    final mockTaskProvider = MockTaskProvider();
    when(mockTaskProvider.tasks).thenReturn([Task(name: 'test', concluido: false)]);

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

  testWidgets("Test 2 - Verify if the list initializes correctly and checkbox value is True", (WidgetTester tester) async {
    final mockTaskProvider = MockTaskProvider();
    var testTask = Task(name: 'test', concluido: true);
    when(mockTaskProvider.tasks).thenReturn([testTask]);

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
    
    final Finder checkboxFinder = find.byType(Checkbox);
    var checkbox = tester.firstWidget<Checkbox>(checkboxFinder);
    expect(checkbox.value, isTrue); 
  });
  testWidgets("Test 3 - Verify if the list initializes empty", (WidgetTester tester) async {
    final mockTaskProvider = MockTaskProvider();
    when(mockTaskProvider.tasks).thenReturn([]);

    Widget app = MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(create: (context) => mockTaskProvider)
      ],
      child: const MaterialApp(
        home: TaskScreen(),
      ),
    );
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    expect(mockTaskProvider.tasks, isEmpty);
  });
}