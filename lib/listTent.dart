import 'package:flutter/material.dart';
import 'tent1.dart';
import 'tent2.dart';
import 'tent3.dart';
import 'tent4.dart';
import 'tent5.dart';
import 'tent6.dart';
import 'tent7.dart';
import 'tent8.dart';
import 'tent9.dart';
import 'userMenu.dart';
import 'bookingList.dart';
import 'profile.dart';

class ListTentScreen extends StatefulWidget {
  @override
  _ListTentScreenState createState() => _ListTentScreenState();
}

class _ListTentScreenState extends State<ListTentScreen> {
  final List<Map<String, dynamic>> tents = [
    {'name': 'CAMEL SMALL TENT', 'image': 'assets/tent1.jpg'},
    {'name': 'BELL TENT COUPLE', 'image': 'assets/tent2.jpg'},
    {'name': 'CAMEL BIG TENT', 'image': 'assets/tent3.jpg'},
    {'name': 'COLEMAN', 'image': 'assets/tent4.jpg'},
    {'name': 'HAMMOCK', 'image': 'assets/tent5.jpg'},
    {'name': 'TENDA 6', 'image': 'assets/tent6.jpg'},
    {'name': 'TENDA 8', 'image': 'assets/tent7.jpg'},
    {'name': 'TENDA 4', 'image': 'assets/tent8.jpg'},
    {'name': 'BAZOONGI', 'image': 'assets/tent9.jpg'},
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserMenu()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookingList()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Tents'),
        backgroundColor: Colors.black12,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserMenu()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tents.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (tents[index]['name'] == 'CAMEL SMALL TENT') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tent1()),
                );
              } else if (tents[index]['name'] == 'BELL TENT COUPLE') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tent2()),
                );
              } else if (tents[index]['name'] == 'CAMEL BIG TENT') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tent3()),
                );
              } else if (tents[index]['name'] == 'COLEMAN') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tent4()),
                );
              } else if (tents[index]['name'] == 'HAMMOCK') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tent5()),
                );
              } else if (tents[index]['name'] == 'TENDA 6') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tent6()),
                );
              } else if (tents[index]['name'] == 'TENDA 8') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tent7()),
                );
              } else if (tents[index]['name'] == 'TENDA 4') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tent8()),
                );
              } else if (tents[index]['name'] == 'BAZOONGI') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tent9()),
                );
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(8),
              width: 600,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 250,
                        width: 300,
                        color: Colors.black,
                        child: Image.asset(
                          tents[index]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    tents[index]['name'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ListTentScreen(),
  ));
}
