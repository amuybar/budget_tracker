import 'package:flutter/material.dart';
import 'package:myapp/pages/NavigationPages/Account_page.dart';
import 'package:myapp/pages/NavigationPages/Home_page.dart';
import 'package:myapp/pages/NavigationPages/Update_income_page.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final pages = <Widget>[
    const Home(),
    const Account(),
    const UpdateIncome(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const drawer(),
      body: pages[index],
     bottomNavigationBar: Stack(
  children: [
    BottomNavigationBar(
      currentIndex: index,
      onTap: (selectedindex) {
        setState(() {
          index = selectedindex;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.update),
          label: 'Update Income',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
      unselectedItemColor: const Color.fromARGB(255, 58, 58, 58),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 1.0,
      selectedFontSize: 14.0,
      unselectedFontSize: 12.0,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Color.fromARGB(255, 145, 189, 255),
      ),
      selectedIconTheme: const IconThemeData(
        color: Color.fromARGB(255, 34, 122, 255),
      ),
      showSelectedLabels: true,
    ),
    Positioned(
      bottom: 60, // Adjust the position as needed
      left: MediaQuery.of(context).size.width / 3.5, // Adjust the position as needed
      child: Icon(
        index == 0 ? Icons.home :
          index == 1 ? Icons.account_circle :
          Icons.update,
        size: 40, // Adjust the size as needed
        color: index == 0 ? Colors.blue :
          index == 1 ? Colors.green :
          Colors.orange,
      ),
    ),
  ],
),

    );
  }
}

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.43,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 22, 44, 63),
            ),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Navigate to settings page
            },
          ),
          ListTile(
            title: const Text('History'),
            onTap: () {
              // Navigate to help page
            },
          ),
          ListTile(
            title: const Text('Calender'),
            onTap: () {
              // Navigate to help page
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            onTap: () {
              // Navigate to help page
            },
          ),
          ListTile(
            title: const Text('Help'),
            onTap: () {
              // Navigate to help page
            },
          ),
        ],
      ),
    );
  }
}




