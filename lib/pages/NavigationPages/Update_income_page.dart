import 'package:flutter/material.dart';

class UpdateIncome extends StatefulWidget {
  const UpdateIncome({super.key});

  @override
  _UpdateIncomeState createState() => _UpdateIncomeState();
}

class _UpdateIncomeState extends State<UpdateIncome> {
  List<String> incomeSources = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Income Sources:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: incomeSources.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(incomeSources[index]),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Add income for this source
                        _showAddIncomeDialog(context, incomeSources[index]);
                      },
                      child: const Text('Add Income', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Show dialog to add income source
                  _showAddSourceDialog(context);
                },
                child: const Text('Add Income Source'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddSourceDialog(BuildContext context) {
    String newSource = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Income Source'),
          content: TextField(
            onChanged: (value) {
              newSource = value;
            },
            decoration: const InputDecoration(labelText: 'Income Source'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  incomeSources.add(newSource);
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showAddIncomeDialog(BuildContext context, String source) {
    showDialog(
      context: context,
      builder: (context) {
        double amount = 0;
        return AlertDialog(
          title: Text('Add Income for $source'),
          content: TextField(
            
            keyboardType: TextInputType.number,
            onChanged: (value) {
              amount = double.parse(value);
            },
            decoration: const InputDecoration(labelText: 'Income Amount',),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add income for the selected source
                // For demonstration, just print the amount
                print('Income added for $source: $amount');
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
