import 'package:flutter/material.dart';
import 'Screens/Login.dart';
import 'Screens/UserRegistration.dart';
import 'Screens/Dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xff0a96fa),
        accentColor: Colors.blue.shade600
      ),
      home: Dashboard(),
    );
  }
}
