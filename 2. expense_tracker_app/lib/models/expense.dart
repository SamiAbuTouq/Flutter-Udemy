import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();
final formatter = DateFormat.yMEd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff_outlined,
  Category.leisure: Icons.movie_outlined,
  Category.work: Icons.work_history_outlined,
};

class Expense {
  Expense({
    required this.amount,
    required this.date,
    required this.category,
    required this.title,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
