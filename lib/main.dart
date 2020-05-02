import 'package:flutter/material.dart';
import 'Screens/Login.dart';
import 'Screens/UserRegistration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserRegistration(),
    );
  }
}
