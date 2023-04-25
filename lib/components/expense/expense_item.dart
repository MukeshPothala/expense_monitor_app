import 'package:expense_monitor_app/model/expense_schema.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final ExpenseSchema expense;
  @override
  Widget build(BuildContext context) {
    return (Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              expense.title.toString().toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  '₹ ${expense.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(categoryIcons[expense.category]),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(expense.category.toString().split('.')[1]),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(expense.formatDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
