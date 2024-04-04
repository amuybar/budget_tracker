import 'package:flutter/material.dart';
import 'package:myapp/widgets/constant.dart';
import 'package:supabase/supabase.dart';

class EditExpensePage extends StatefulWidget {
  final int expenseId;

  EditExpensePage({Key? key, required this.expenseId}) : super(key: key);

  @override
  _EditExpensePageState createState() => _EditExpensePageState();
}

class _EditExpensePageState extends State<EditExpensePage> {
  late String _selectedCategory;
  late TextEditingController _nameController;
  late TextEditingController _amountController;
  final supabase = SupabaseClient('your_supabase_url', 'your_supabase_key');

  @override
  void initState() {
    super.initState();
    _selectedCategory = categories.first;
    _nameController = TextEditingController();
    _amountController = TextEditingController();
    _fetchExpense();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Category',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _editExpense();
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  void _fetchExpense() async {
    // Fetch the expense data from Supabase using the provided expense ID
    // Replace the following line with your logic to fetch expense details from Supabase based on the expense ID
    Map<String, dynamic> expenseData = {}; // Replace this with your logic to fetch expense details
    _nameController.text = expenseData['name'] ?? '';
    _amountController.text = expenseData['amount']?.toString() ?? '';
    _selectedCategory = expenseData['category'] ?? '';
  }

  void _editExpense() async {
    String name = _nameController.text;
    double amount = double.tryParse(_amountController.text) ?? 0.0;

    if (name.isNotEmpty && amount > 0) {
      Map<String, dynamic> updatedExpense = {
        'name': name,
        'amount': amount,
        'category': _selectedCategory,
      };

      // Send the updated expense data to Supabase
      final response = await supabase.from('expenses').update(updatedExpense);

      if (response.error == null) {
        // Expense updated successfully
        Navigator.pop(context);
      } else {
        // Error occurred while updating expense, handle it accordingly
        print('Error updating expense: ${response.error?.message}');
      }
    } else {
      // Show error message or handle invalid input
    }
  }
}
