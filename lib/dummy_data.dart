import 'package:expense_monitor_app/model/expense_schema.dart';

List<ExpenseSchema> expenseRegistered = [
  ExpenseSchema(
    title: 'bus',
    amount: 130,
    date: DateTime.now(),
    category: Category.travel,
  ),
  ExpenseSchema(
    title: 'Movie',
    amount: 290,
    date: DateTime.now(),
    category: Category.entertainment,
  ),
  ExpenseSchema(
    title: 'Biryani',
    amount: 140,
    date: DateTime.now(),
    category: Category.food,
  ),
  ExpenseSchema(
    title: 'Flutter Course',
    amount: 450,
    date: DateTime.now(),
    category: Category.work,
  ),
];
