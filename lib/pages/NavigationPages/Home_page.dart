import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16.0),
      children: [
        buildCard(context, 'Expense Tracking', Icons.attach_money,
            Color.fromARGB(255, 41, 228, 41), '/expense_list'),
        buildCard(context, 'Income Tracking', Icons.monetization_on,
            Color.fromARGB(255, 255, 162, 13), '/income_list'),
        buildCard(context, 'Budget Management', Icons.account_balance_wallet,
            Color.fromARGB(255, 108, 24, 122), '/budget'),
        buildCard(context, 'Savings Goals', Icons.savings,
            Color.fromARGB(255, 10, 109, 101), '/savings_goals'),
        buildCard(context, 'Transaction History', Icons.history,
            const Color.fromARGB(255, 32, 10, 9), '/transaction_history'),
        buildCard(context, 'Data Visualization', Icons.bar_chart,
            const Color.fromARGB(255, 7, 13, 43), '/charts'),
      ],
    );
  }

  Widget buildCard(BuildContext context, String title, IconData icon,
      Color color, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.white,
            ),
            const SizedBox(height: 10.0),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}