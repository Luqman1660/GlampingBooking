import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUp> {
  final TextEditingController ic = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future signup(BuildContext cont) async {
    if (ic.text == "" ||
        name.text == "" ||
        email.text == "" ||
        password.text == "" ||
        address.text == "" ||
        phone.text == "") {
      Fluttertoast.showToast(
        msg: "All fields cannot be blank!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    } else {
      String uri = "http://10.30.3.13/glamppark/signup.php";
      var response = await http.post(Uri.parse(uri), body: {
        "ic": ic.text,
        "name": name.text,
        "email": email.text,
        "password": password.text,
        "address": address.text,
        "phone": phone.text,
        "usertype": "user",
      });

      var data = json.decode(response.body);
      if (data["success"]) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Fluttertoast.showToast(
          msg: "The user and password do not exist!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: ic,
                decoration: InputDecoration(labelText: 'IC'),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: name,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: email,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: address,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: phone,          
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  signup(context);
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
