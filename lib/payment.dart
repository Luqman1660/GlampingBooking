import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'userMenu.dart'; // Import the user menu screen
import 'bookingList.dart'; // Import the booking list screen
import 'profile.dart'; // Import the profile screen

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PlatformFile? _selectedFile;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate based on the selected index
    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserMenu()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BookingList()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Please scan the QR code for the payment:"),
            SizedBox(height: 16.0),
            Image.asset(
              'assets/QRCode.jpg',
              errorBuilder: (context, error, stackTrace) {
                return Text('QR code image not found');
              },
            ),
            SizedBox(height: 16.0),
            Text("Upload your payment receipt below:"),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  setState(() {
                    _selectedFile = result.files.first;
                  });
                  // Handle the selected file
                  print('File name: ${_selectedFile?.name}');
                  print('File size: ${_selectedFile?.size}');
                  print('File path: ${_selectedFile?.path}');
                } else {
                  // User canceled the picker
                  setState(() {
                    _selectedFile = null;
                  });
                }
              },
              icon: Icon(Icons.attach_file),
              label: Text("Browse"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300], // Button background color
                foregroundColor: Colors.black, // Button text color
              ),
            ),
            if (_selectedFile != null) ...[
              SizedBox(height: 16.0),
              Text('Selected file: ${_selectedFile?.name}'),
            ],
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Handle submit action here
              },
              child: Text('Submit'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 172, 118, 99)), // Button background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Button text color
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
    home: PaymentPage(),
  ));
}
