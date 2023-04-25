import 'package:expense_monitor_app/components/chart/chart.dart';
import 'package:expense_monitor_app/components/expense/new_expense.dart';
import 'package:expense_monitor_app/dummy_data.dart';
import 'package:expense_monitor_app/components/expense/expense_list.dart';
import 'package:flutter/material.dart';

import 'model/expense_schema.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addExpense(ExpenseSchema expense) {
    setState(() {
      expenseRegistered.add(expense);
    });
  }

  void _removeExpense(ExpenseSchema expense) {
    final index = expenseRegistered.indexOf(expense);
    setState(() {
      expenseRegistered.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("expense deleted."),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expenseRegistered.insert(index, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return NewExpense(
          onAddExpense: _addExpense,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContext = const Center(
      child: Text("No Expense Found."),
    );
    if (expenseRegistered.isNotEmpty) {
      mainContext = Center(
        child: Column(children: [
          Chart(expenses: expenseRegistered),
          Expanded(
            child: ExpenseList(
              onRemoveItem: _removeExpense,
              registeredExpenses: expenseRegistered,
            ),
          ),
        ]),
      );
    }
    return (Scaffold(
      appBar: AppBar(
        title: const Text(
          'ExpenseMonitor',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: mainContext,
    ));
  }
}

// class HomePage extends StatelessWidget {
//   
// }
