import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class ExpenseTrackingPage extends StatefulWidget {
  final SupabaseClient supabaseClient;

  const ExpenseTrackingPage({Key? key, required this.supabaseClient}) : super(key: key);

  @override
  _ExpenseTrackingPageState createState() => _ExpenseTrackingPageState();
}

class _ExpenseTrackingPageState extends State<ExpenseTrackingPage> {
  late List<Map<String, dynamic>> expenses;
  
  @override
  void initState() {
    super.initState();
    _fetchExpenses();
  }

  Future<void> _fetchExpenses() async {
  //   try {
  //     final response = await widget.supabaseClient.from('expenses').select('*').eq('name', 'Cereals');
  //     if (response != null) {
  //       // if (response.error != null) {
  //       //   print('Error fetching expenses: ${response.error}');
  //       // } else {
  //       //   setState(() {
  //       //     expenses = response.data as List<Map<String, dynamic>>;
  //       //   });
  //       }
  //     } else {
  //       // Handle empty response (optional)
  //       print('Supabase query might have failed.');
  //     }
  //   } catch (error) {
  //     // Handle other potential errors
  //     print('Error fetching expenses: $error');
  //   }
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracking'),
      ),
      body: expenses != null
          ? ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(expenses[index]['name']),
                  subtitle: Text('\$${expenses[index]['amount']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editExpense(context, index);
                    },
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addExpense(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addExpense(BuildContext context) {
    // Navigate to add expense page
    // Pass the list of categories as arguments to the add expense page
    Navigator.pushNamed(context, '/addExpense', arguments: {
      'categories': _getCategories(),
    });
  }

  void _editExpense(BuildContext context, int index) {
    // Navigate to edit expense page
    // Pass the selected expense details and list of categories as arguments
    Navigator.pushNamed(context, '/editExpense', arguments: {
      'expense': expenses[index],
      'categories': _getCategories(),
    });
  }

  List<String> _getCategories() {
    // Get the list of unique categories from expenses
    List<String> categories = [];
    for (var expense in expenses) {
      if (!categories.contains(expense['category'])) {
        categories.add(expense['category']);
      }
    }
    return categories;
  }
}
