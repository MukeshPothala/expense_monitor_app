import 'package:expense_monitor_app/components/expense/expense_item.dart';
import 'package:expense_monitor_app/model/expense_schema.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key,
      required this.registeredExpenses,
      required this.onRemoveItem});
  final List<ExpenseSchema> registeredExpenses;
  final Function(ExpenseSchema) onRemoveItem;
  @override
  Widget build(BuildContext context) {
    return (ListView.builder(
        itemCount: registeredExpenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(registeredExpenses[index]),
              onDismissed: (direction) {
                onRemoveItem(registeredExpenses[index]);
              },
              child: ExpenseItem(expense: registeredExpenses[index]),
            )));
  }
}
