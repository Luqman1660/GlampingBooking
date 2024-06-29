import 'package:flutter/material.dart';

class ImageCardSwiper extends StatefulWidget {
  @override
  _ImageCardSwiperState createState() => _ImageCardSwiperState();
}

class _ImageCardSwiperState extends State<ImageCardSwiper> {
  int selectedIndex = 0; // Keep track of the selected card index

  List<Widget> cards = [
    _buildCard('assets/activity1.jpg', 'AKTIVITI BAKAR AYAM'),
    _buildCard('assets/activity2.jpg', 'AKTIVITI BOLA TAMPAR '),
    _buildCard('assets/activity3.jpg', 'AKTIVITI RIVER TOUR'),
    _buildCard('assets/activity4.jpg', 'AKTIVITI CANDAT SOTONG'),
    _buildCard('assets/activity5.jpg', 'AKTIVITI CARI LOKAN'),
    _buildCard('assets/activity6.jpg', 'AKTIVITI MANDI PANTAI'),
    _buildCard('assets/activity7.jpg', 'AKTIVITI BITO KETAM NIPAH'),
    _buildCard('assets/activity8.jpg', 'AKTIVITI KAYAK CINTA ALAM'),
  ];

  static Widget _buildCard(String imagePath, String text) {
    return Container(
      padding: EdgeInsets.all(16.0), // Add padding for spacing
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect( // Clip for rounded corners
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 118.0), // Add spacing between image and text
          Padding(
            padding: const EdgeInsets.only(top:50.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
        ],
      ),
    );
  }

  void navigateLeft() {
    setState(() {
      selectedIndex = (selectedIndex - 1) % cards.length; // Handle looping
    });
  }

  void navigateRight() {
    setState(() {
      selectedIndex = (selectedIndex + 1) % cards.length; // Handle looping
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity View'),
        backgroundColor: Colors.black12, // Set your desired title
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: cards,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: navigateLeft,
              ),
              SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: navigateRight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
