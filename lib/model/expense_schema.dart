import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
Uuid uuidObj = const Uuid();

enum Category {
  housing,
  bills,
  insurance,
  education,
  entertainment,
  work,
  food,
  travel,
  healthCare,
  shopping,
  debts
}

const categoryIcons = {
  Category.food: Icons.dining,
  Category.travel: Icons.emoji_transportation,
  Category.work: Icons.work,
  Category.housing: Icons.house,
  Category.bills: Icons.aod,
  Category.insurance: Icons.safety_check,
  Category.education: Icons.school,
  Category.entertainment: Icons.emoji_emotions,
  Category.debts: Icons.balance,
  Category.shopping: Icons.shopping_cart,
  Category.healthCare: Icons.health_and_safety
};

class ExpenseSchema {
  ExpenseSchema({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuidObj.v4();
  String id;
  String title;
  double amount;
  DateTime date;
  Category category;
  String get formatDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<ExpenseSchema> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();
  final Category category;
  final List<ExpenseSchema> expenses;
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
