import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const ListTile(
              title: Text('Username:'),
              subtitle: Text('JohnDoe'),
            ),
            const ListTile(
              title: Text('Email:'),
              subtitle: Text('johndoe@example.com'),
            ),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Actions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Change Account Details'),
              onTap: () {
                // Navigate to change account details page
                Navigator.pushNamed(context, '/auth');
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete Account'),
              onTap: () {
                // Show delete confirmation dialog
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('Provide Feedback'),
              onTap: () {
                // Navigate to feedback page
              },
            ),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Navigation:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                // Navigate to dashboard page
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Expense Tracking'),
              onTap: () {
                // Navigate to expense tracking page
              },
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: const Text('Income Tracking'),
              onTap: () {
                // Navigate to income tracking page
              },
            ),
            // Add more navigation options as needed
          ],
        ),
      ),
    );
  }
}
