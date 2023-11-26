import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:learning_flutter2/main.dart' as app;

void main () {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Integration Test 01 - Ensure that the task is initialized correctly", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final Finder textFinder = find.text('Task demo 1');
    expect(textFinder, findsOneWidget);

    final Finder checkboxFinder = find.byType(Checkbox);
    expect(checkboxFinder, findsOneWidget);

    var checkbox = tester.firstWidget<Checkbox>(checkboxFinder);
    expect(checkbox.value, isFalse);
  });

  testWidgets("Integration Test 02 - Tap the checkbox", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final Finder checkboxFinder = find.byType(Checkbox);
    expect(checkboxFinder, findsOneWidget);

    await tester.tap(checkboxFinder);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    var checkbox = tester.firstWidget<Checkbox>(checkboxFinder);
    expect(checkbox.value, isTrue);
  });

  testWidgets("Integration Test 03 - Uncheck the checkbox", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final Finder checkboxFinder = find.byType(Checkbox);
    expect(checkboxFinder, findsOneWidget);

    await tester.tap(checkboxFinder);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    var checkbox = tester.firstWidget<Checkbox>(checkboxFinder);
    expect(checkbox.value, isTrue);

    await tester.tap(checkboxFinder);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    checkbox = tester.firstWidget<Checkbox>(checkboxFinder);
    expect(checkbox.value, isFalse);
  });
  testWidgets("Integration Test 04 - Delete the task", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final Finder trashFinder = find.byIcon(Icons.delete);
    expect(trashFinder, findsOneWidget);

    await tester.tap(trashFinder);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    final Finder textFinder = find.text('Task demo 1');
    expect(textFinder, findsNothing);
  });

  testWidgets("Integration Test 05 - Add a task", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final Finder addTaskButton = find.byIcon(Icons.add);
    expect(addTaskButton, findsOneWidget);

    await tester.tap(addTaskButton);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    final Finder nameField = find.byKey(const Key('NameKey1'));
    expect(nameField, findsOneWidget);

    await tester.enterText(nameField, 'test2');
    await tester.pumpAndSettle(const Duration(seconds: 3));

    final Finder saveButton = find.text('Salvar');
    expect(saveButton, findsOneWidget);

    await tester.tap(saveButton);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    final Finder textFinder = find.text('test2');
    expect(textFinder, findsOneWidget);
  });
}