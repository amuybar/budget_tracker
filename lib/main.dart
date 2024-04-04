import 'package:flutter/material.dart';
import 'package:myapp/pages/DashBoard/dashboard_page.dart';
import 'package:myapp/pages/authentication/login_page.dart';
import 'package:myapp/pages/authentication/register_page.dart';
import 'package:myapp/pages/expense_tracking/add_expense_page.dart';
import 'package:myapp/pages/expense_tracking/edit_expense_page.dart';
import 'package:myapp/pages/expense_tracking/expense_list_page.dart';
import 'package:myapp/services/constants_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: token,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
final supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light, // Dark theme
        primarySwatch: Colors.blue, // Change as needed
        fontFamily: 'Roboto', // Change as needed
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white, // Change as needed
          ),
        ),
        iconTheme: const IconThemeData(
          // Define icon theme
          size: 24,
          color: Colors.white, // Change as needed
        ),
      ),
      initialRoute: '/home', // Initial route
      routes: {
        '/auth': (context) => LoginPage(), // Define routes
        '/register': (context) => RegisterPage(),
        '/home':(context)=>DashboardPage(),
        '/expense_list': (context) => ExpenseTrackingPage(supabaseClient: supabase,),
        '/editExpense': (context) => EditExpensePage(expenseId: 2, ),
        '/addExpense': (context) => AddExpensePage(),
        // '/addIncome': (context) => AddIncomePage(),
        // '/editIncome': (context) => EditIncomePage(),
        // '/incomeList': (context) => IncomeListPage(),
        // '/budget': (context) => BudgetPage(),
        // '/addSavingsGoal': (context) => AddSavingsGoalPage(),
        // '/editSavingsGoal': (context) => EditSavingsGoalPage(),
        // '/savingsGoals': (context) => SavingsGoalsPage(),
        // '/transactionHistory': (context) => TransactionHistoryPage(),
      },
    );
  }
}
