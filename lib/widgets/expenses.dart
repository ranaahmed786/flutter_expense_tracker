import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/widgets/expenseslist/expenses_list.dart';
import 'package:flutter_expense_tracker/widgets/new_item_overlay.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void _showModelOverlaySheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) {
        return NewItemOverlay(addExpense: addExpense);
      },
    );
  }

  void removeExpense(Expense expense) {
    final indexOfExpense = _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${expense.title} removed!'),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(indexOfExpense, expense);
            });
          },
        ),
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  Widget handleEmptyList() {
    if (_expenses.isEmpty) {
      return const Center(child: Text('No expenses added yet!'));
    } else {
      return ExpensesList(
        expenseslist: _expenses,
        onRemoveExpense: removeExpense,
      );
    }
  }

  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 49.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Groceries',
      amount: 75.50,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Gym Membership',
      amount: 29.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: () => _showModelOverlaySheet(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('List of Expenses'),
          Expanded(child: handleEmptyList()),
        ],
      ),
    );
  }
}
