import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/widgets/expenseslist/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenseslist,
    required this.onRemoveExpense,
  });
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenseslist;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseslist.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenseslist[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => {onRemoveExpense(expenseslist[index])},
        child: ExpenseItem(expenseslist[index]),
      ),
    );
  }
}
