import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'addTent.dart'; // Assuming this is where AddTentForm is defined

class AdminTentList extends StatefulWidget {
  @override
  _AdminTentListState createState() => _AdminTentListState();
}

class _AdminTentListState extends State<AdminTentList> {
  List tents = [];

  @override
  void initState() {
    super.initState();
    fetchTents();
  }

  Future<void> fetchTents() async {
    try {
      final response = await http.get(Uri.parse('http://10.30.3.13/glamppark/tent.php'));

      if (response.statusCode == 200) {
        setState(() {
          tents = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load tents');
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed the title from the AppBar
      body: tents.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tents.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(tents[index]['TentName']),
                    subtitle: Text(tents[index]['Description']),
                    trailing: Text('\RM${tents[index]['Price']} - Capacity: ${tents[index]['Capacity']}'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTentForm()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AdminTentList(),
  ));
}
