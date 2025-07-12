import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';

class NewItemOverlay extends StatefulWidget {
  const NewItemOverlay({super.key, required this.addExpense});
  final void Function(Expense expense) addExpense;
  @override
  State<NewItemOverlay> createState() => _NewItemOverlayState();
}

class _NewItemOverlayState extends State<NewItemOverlay> {
  // Move all mutable state to the State class
  Category _selectedCategory = Category.food;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  Expense get _getExpense {
    return Expense(
      amount: double.parse(_amountController.text),
      title: _titleController.text,
      date: _selectedDate ?? DateTime.now(),
      category: _selectedCategory,
    );
  }

  void onSubmit() {
    final bool isInValidAmount =
        double.tryParse(_amountController.text) == null;
    if (_titleController.text.trim().isEmpty ||
        isInValidAmount ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please provide a valid title, amount and date.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.addExpense(_getExpense);
    Navigator.of(context).pop();
  }

  void onCancel() {
    setState(() {
      _amountController.clear();
      _titleController.clear();
      _selectedDate = null;
      _selectedCategory = Category.food;
    });
    Navigator.of(context).pop();
  }

  void _datePicker() async {
    final today = DateTime.now();
    final firstDate = DateTime(today.year - 1, today.month, today.day);
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: today,
      initialDate: today,
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // This is the Title TextField
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
            controller: _titleController,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          // This is the Amount TextField
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount'),
              prefix: Text('\$'),
            ),
            controller: _amountController,
            style: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.primary, // Change this to your desired color
            ),
          ),
          // This is the Category and Date Row
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Category Dropdown
              Container(
                width: 180,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Category>(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (item) => DropdownMenuItem<Category>(
                            value: item,
                            child: Center(
                              child: Text(
                                item.name.toUpperCase(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                  ),
                ),
              ),
              // Date Picker
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 180,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate != null
                            ? formater.format(_selectedDate!)
                            : 'No Date Selected',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_month),
                        onPressed: _datePicker,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Submit Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: onSubmit, child: Text('Submit')),
              ElevatedButton(onPressed: onCancel, child: Text('Cancel')),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
