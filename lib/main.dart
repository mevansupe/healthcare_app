import 'package:flutter/material.dart';
import 'Screens/Login.dart';
import 'Screens/UserRegistration.dart';
import 'Screens/Dashboard.dart';
import 'Screens/HospitalRegistration.dart';
import 'Screens/DoctorRegistration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff0a96fa),
        accentColor: Colors.blue.shade600
      ),
      home: DoctorRegistration(),
    );
  }
}
