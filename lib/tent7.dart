import 'package:flutter/material.dart';
import 'bookingdetails.dart';
import 'userMenu.dart';
import 'bookingList.dart';
import 'profile.dart';

class Tent7 extends StatefulWidget {
  @override
  _Tent7State createState() => _Tent7State();
}

class _Tent7State extends State<Tent7> {
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
        title: Text('TENDA 8'),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // Adjust this value to move the text higher
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 300, // Set the width you want
                    maxHeight: 300, // Set the height you want
                  ),
                  child: Image.asset(
                    'assets/tent7.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0), // Adjust this value as needed
              child: Text(
                'TENDA 8',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // Adjust this value as needed
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'RM 150',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: '/night',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '2 Tilam Queen, 4 Bantal, 2 Cadar, 2 Selimut, plug, Kipas, Lampu portable, Lampu hiasan, 1 Alas Kaki, 1 Karpet',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // Add padding around the text
              child: Text(
                ' 4 Pax', // Add the '4 Pax' text here
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the booking details page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingDetails()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 172, 118, 99)), // Change the button color to brown
              ),
              child: Text(
                'Book Now',
                style: TextStyle(color: Colors.black), // Change the text color to black
              ),
            ),
          ],
        ),
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
    home: Tent7(),
  ));
}
