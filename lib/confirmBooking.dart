import 'package:flutter/material.dart';
import 'payment.dart';

class ConfirmBooking extends StatelessWidget {
  final String name;
  final String checkInDate;
  final String checkOutDate;
  final int totalGuest;
  final double totalPrice;
  final double depositStatus;

  ConfirmBooking({
    required this.name,
    required this.checkInDate,
    required this.checkOutDate,
    required this.totalGuest,
    required this.totalPrice,
    required this.depositStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirm'),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name : $name"),
            Text("Room : Bell Couple Tent"), // Assuming room type is fixed for this example
            Text("Booking Check in : $checkInDate"),
            Text("Booking Check out : $checkOutDate"),
            Text("Total Guest : $totalGuest"),
            Text("Total Price : Rm $totalPrice"),
            Text("Deposit Status : Rm $depositStatus"),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 172, 118, 99)), // Change the button color to brown
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.black), // Change the text color to black
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 172, 118, 99)), // Change the button color to brown
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black), // Change the text color to black
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
