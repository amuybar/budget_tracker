import 'package:flutter/material.dart';
import 'package:myapp/services/constants_services.dart';
import 'package:myapp/widgets/constant.dart';
import 'package:supabase/supabase.dart';

class AddExpensePage extends StatefulWidget {
  
  AddExpensePage({Key? key, }) : super(key: key);

  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {

  late String _selectedCategory;
  late TextEditingController _nameController;
  late TextEditingController _amountController;
  final supabase = SupabaseClient(supabaseUrl, token);

  @override
  void initState() {
    super.initState();
    _selectedCategory = categories.first;
    _nameController = TextEditingController();
    _amountController = TextEditingController();
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
        title: const Text('Add Expense'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: 'Arial',
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black,
                  decorationStyle: TextDecorationStyle.solid,
                  letterSpacing: 1.0,
                  wordSpacing: 2.0,
                  height: 1.5,
                 ),
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                  style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: 'Arial',
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black,
                  decorationStyle: TextDecorationStyle.solid,
                  letterSpacing: 1.0,
                  wordSpacing: 2.0,
                  height: 1.5,
                 ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24.0,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 4.0,
                    shadowColor: Colors.grey,
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    
                    
                  ),
                 onPressed: () {
                    if (_validateInput()) {
                      _addExpense();
                    }
                  },
                  child: const Text('Add Expense'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
bool _validateInput() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a name')));
      return false;
    }
    if (_amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter an amount')));
      return false;
    }
    return true;
  }

  void _addExpense() async {
    String name = _nameController.text;
    double amount = double.tryParse(_amountController.text) ?? 0.0;

    Map<String, dynamic> newExpense = {
      'name': name,
      'amount': amount,
      'category': _selectedCategory,
    };

    final response = await supabase.from('Expense').insert(newExpense);

    if (response.error == null) {
      Navigator.pop(context, newExpense);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error adding expense: ${response.error?.message}')));
    }
  }
}