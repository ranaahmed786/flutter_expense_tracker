import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formater = DateFormat.yMd();

enum Category { food, travel, leisure, work }

final categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

/// Represents an expense with a unique identifier, title, amount, and date.
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formater.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.totalExpenses});
  final Category category;
  double totalExpenses = 0;
  ExpenseBucket.forCategory(List<Expense> expenses, this.category) {
    double total = 0;
    for (final expense in expenses) {
      if (expense.category == category) {
        total += expense.amount;
      }
    }
    totalExpenses = total;
  }
  double get fill {
    if (totalExpenses == 0) {
      return 0;
    }
    return totalExpenses! / 100; // Assuming 100 is the max for normalization
  }
}
