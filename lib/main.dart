import 'package:flutter/material.dart';
import 'package:triggin_app/screens/login.dart';
import 'package:triggin_app/webservices/APIs.dart';

import 'authorization_screens/signUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Triggin',
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home:
      const Login(),
    );
  }
}

