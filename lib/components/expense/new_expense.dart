import 'package:expense_monitor_app/model/expense_schema.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final Function(ExpenseSchema expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _enteredTitle = "";
  var _enteredAmountString = "";
  Category _selectedCategoryItem = Category.food;
  DateTime? _selectedDate;
  void _saveTitleInput(String input) {
    _enteredTitle = input;
  }

  void _saveAmountInput(String input) {
    _enteredAmountString = input;
  }

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _sumbitData() {
    final enteredAmount = double.tryParse(_enteredAmountString);
    if (_enteredTitle.trim().isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        _selectedDate == null) {
      //return err
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            'Invalid input',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
          content: const Text(
              'Please make sure you enter vaild details in respected fields.'),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue),
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('OKAY'),
              ),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      ExpenseSchema(
        title: _enteredTitle,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategoryItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
      child: Column(children: [
        TextField(
          onChanged: _saveTitleInput,
          maxLength: 50,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            label: Text('Title'),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: _saveAmountInput,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: Text('₹ '),
                  label: Text('Amount'),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _datePicker,
                    icon: const Icon(Icons.edit_calendar_rounded),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            DropdownButton(
              value: _selectedCategoryItem,
              items: Category.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedCategoryItem = value;
                });
              },
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white),
              onPressed: () {
                _sumbitData();
                Navigator.pop(context);
              },
              child: const Text('Save Details'),
            ),
          ],
        )
      ]),
    ));
  }
}
