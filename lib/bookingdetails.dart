import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting
import 'confirmBooking.dart'; // Import the confirm booking screen
import 'userMenu.dart'; // Import the user menu screen
import 'bookingList.dart'; // Import the booking list screen
import 'profile.dart'; // Import the profile screen

class BookingDetails extends StatefulWidget {
  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _checkInDateController = TextEditingController();
  final TextEditingController _checkOutDateController = TextEditingController();
  final TextEditingController _totalGuestController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

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
        title: Text('Booking Details'),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _checkInDateController,
                decoration: InputDecoration(
                  labelText: 'Check In Date',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, _checkInDateController),
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a check-in date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _checkOutDateController,
                decoration: InputDecoration(
                  labelText: 'Check Out Date',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, _checkOutDateController),
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a check-out date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _totalGuestController,
                decoration: InputDecoration(
                  labelText: 'Total Guest',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of guests';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Calculate total price and deposit status
                    int totalGuest = int.parse(_totalGuestController.text);
                    double totalPrice = 155; // Example total price
                    double depositStatus = 25; // Example deposit status

                    // Navigate to ConfirmBooking screen with the details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmBooking(
                          name: _nameController.text,
                          checkInDate: _checkInDateController.text,
                          checkOutDate: _checkOutDateController.text,
                          totalGuest: totalGuest,
                          totalPrice: totalPrice,
                          depositStatus: depositStatus,
                        ),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 172, 118, 99)), // Change the button color to brown
                ),
                child: Text(
                  'Book',
                  style: TextStyle(color: Colors.black), // Change the text color to black
                ),
              ),
            ],
          ),
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
    home: BookingDetails(),
  ));
}
