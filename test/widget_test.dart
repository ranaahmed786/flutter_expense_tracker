// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_expense_tracker/widgets/expenses.dart';

void main() {
  testWidgets('Expense tracker app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: const Expenses()));

    // Verify that our expense tracker loads
    expect(find.text('Expenses Tracker'), findsOneWidget);
    expect(find.text('List of Expenses'), findsOneWidget);

    // Verify that we have some expenses displayed
    expect(find.text('Flutter Course'), findsOneWidget);
    expect(find.text('Groceries'), findsOneWidget);
  });
}
