import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddTentForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController TentIDController = TextEditingController();
  final TextEditingController TentNameController = TextEditingController();
  final TextEditingController PriceController = TextEditingController();
  final TextEditingController CapacityController = TextEditingController();
  final TextEditingController DescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Tent'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: TentIDController,
                decoration: InputDecoration(labelText: 'Tent ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Tent ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: TentNameController,
                decoration: InputDecoration(labelText: 'Tent Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Tent Name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: PriceController,
                decoration: InputDecoration(labelText: 'Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: CapacityController,
                decoration: InputDecoration(labelText: 'Capacity'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Capacity';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: DescriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Prepare data from controllers
                    String TentID = TentIDController.text;
                    String TentName = TentNameController.text;
                    String Price = PriceController.text;
                    String Capacity = CapacityController.text;
                    String Description = DescriptionController.text;

                    // Send data to backend API
                    var url = Uri.parse('http://10.30.3.13/glamppark/addTent.php');
                    var response = await http.post(
                      url,
                      headers: {'Content-Type': 'application/json'},
                      body: jsonEncode({
                        'TentID': TentID,
                        'TentName': TentName,
                        'Price': Price,
                        'Capacity': Capacity,
                        'Description': Description,
                      }),
                    );

                    if (response.statusCode == 200) {
                      // Successful submission, handle accordingly (e.g., show success message)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tent added successfully')),
                      );
                      Navigator.pop(context); // Close the form after successful submission
                    } else {
                      // Error handling (e.g., show error message)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error adding tent')),
                      );
                      // Handle error feedback to the user
                    }
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
