import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'signup.dart';
import 'adminMenu.dart';
import 'userMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Page',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MERCHANG GLAMPING PARK '),
        backgroundColor: Colors.black12,
        automaticallyImplyLeading: false, // This hides the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image
            Image.asset(
              'assets/login.jpg',
              height: 300,
              width: 300,
            ),
            SizedBox(height: 30),

            // Login Form
            LoginForm(),

            SizedBox(height: 20),

            // Sign Up Sentence
            GestureDetector(
              onTap: () {
                // Navigate to the sign-up page
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text(
                'Dont have an account? Sign Up',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController ic = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future login(BuildContext cont) async {
    if (ic.text == "" || password.text == "") {
      Fluttertoast.showToast(
        msg: "Both fields cannot be blank!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    } else {
      String uri = "http://10.30.3.13/glamppark/login.php";
      var response = await http.post(Uri.parse(uri), body: {
        "ic": ic.text,
        "password": password.text,
      });

      var data = json.decode(response.body);
      if (data["result"].toString() == "success") {
        // Check the user type
        if (data["usertype"].toString() == "user") {
          Navigator.push(
              cont, MaterialPageRoute(builder: (context) => UserMenu()));
        } else if (data["usertype"].toString() == "admin") {
          // Navigate to admin page
          Navigator.push(
              cont, MaterialPageRoute(builder: (context) => AdminMenu()));
        }
      } else {
        Fluttertoast.showToast(
          msg: "The user and password does not exist!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email field
        TextField(
          controller: ic,
          decoration: InputDecoration(
            labelText: 'IC',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 12),

        // Password field
        TextField(
          controller: password,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        SizedBox(height: 12),

        // Login Button
        ElevatedButton(
          onPressed: () {
            login(context);
          },
          child: Text('Login'),
        ),
      ],
    );
  }
}
