import 'package:flutter/material.dart';
import 'adminBookingList.dart'; // Import the AdminBookingList widget
import 'adminTentList.dart'; // Import the AdminTentList Page widget

class AdminMenu extends StatefulWidget {
  @override
  _AdminMenuState createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    AdminBookingList(),
    AdminTentList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout() {
    // Perform logout actions here, such as navigating to the login screen
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Menu'),
        backgroundColor: Colors.black12,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store), // Change to an appropriate icon
            label: 'Tent',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
