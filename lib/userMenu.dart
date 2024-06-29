import 'package:flutter/material.dart';
import 'package:glamping/main.dart';
import 'listTent.dart'; // Import the ListTentScreen widget
import 'view activity.dart'; // Import the ViewActivityScreen widget

class UserMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Menu'),
        backgroundColor: Colors.black12,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ); // Navigate back to the previous screen
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add the image widget here
            Image.asset(
              'assets/homepage.jpg',
              height: 300,
              width: 300,
            ),
            SizedBox(height: 30),
            Text(
              'Welcome to Merchang Glamping Park',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListTentScreen()), // Navigate to ListTentScreen
                );
              },
              child: Text('Booking Tent'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageCardSwiper()), // Navigate to ViewActivityScreen
                );
              },
              child: Text('View activity'),
            ),
          ],
        ),
      ),
    );
  }
}
