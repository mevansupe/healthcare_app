import 'package:flutter/material.dart';
import 'package:healthcareapp/Screens/Dashboard.dart';
import 'package:healthcareapp/Screens/Login.dart';
import 'package:healthcareapp/Screens/New_Appoinment.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'Screens/DoctorRegistration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
