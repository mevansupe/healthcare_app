import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_slider/page_slider.dart';
import 'package:healthcareapp/Components/MspButton.dart';

class UserRegistration extends StatefulWidget {
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

enum PhysicalDisorderSelector { yes, no }
enum MedicalAllergiesSelector { yes, no }

class _UserRegistrationState extends State<UserRegistration> {
  final _formKey = GlobalKey<FormState>();
  PhysicalDisorderSelector _character = PhysicalDisorderSelector.no;
  MedicalAllergiesSelector _medicalallegy = MedicalAllergiesSelector.no;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FormTextBox(
                    hint: "First Name",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "Last Name",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "NIC",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "Date of birth",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "Email Address",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "Mobile Number",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "Emergency Number",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Do you have physical disorders?",
                          style: TextStyle(
//                        color: Colors.pinkAccent.shade200,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text('Yes'),
                    leading: Radio(
//                      activeColor: Colors.pinkAccent.shade200,
                      value: PhysicalDisorderSelector.yes,
                      groupValue: _character,
                      onChanged: (PhysicalDisorderSelector value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('No'),
                    leading: Radio(
//                      activeColor: Colors.pinkAccent.shade200,
                      value: PhysicalDisorderSelector.no,
                      groupValue: _character,
                      onChanged: (PhysicalDisorderSelector value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  _character == PhysicalDisorderSelector.yes
                      ? FormTextBox(
                          hint: "Physical Disorder",
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Do you have medical allergies?",
                          style: TextStyle(
//                            color: Colors.pinkAccent.shade200,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text('Yes'),
                    leading: Radio(
//                      activeColor: Colors.pinkAccent.shade200,
                      value: MedicalAllergiesSelector.yes,
                      groupValue: _medicalallegy,
                      onChanged: (MedicalAllergiesSelector value) {
                        setState(() {
                          _medicalallegy = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('No'),
                    leading: Radio(
//                      activeColor: Colors.pinkAccent.shade200,
                      value: MedicalAllergiesSelector.no,
                      groupValue: _medicalallegy,
                      onChanged: (MedicalAllergiesSelector value) {
                        setState(() {
                          _medicalallegy = value;
                        });
                      },
                    ),
                  ),
                  _medicalallegy == MedicalAllergiesSelector.yes
                      ? FormTextBox(
                          hint: "Medical Allergies",
                        )
                      : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: MspButton(
                            color: Colors.lightBlue,
                            title: "Register",
                            onPressed: () {
                              print("object");
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormTextBox extends StatelessWidget {
  FormTextBox({@required this.hint, @required this.onChanged});

  final String hint;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 20),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 18),
                hintText: hint,
//                enabledBorder: OutlineInputBorder(
//                  borderSide: const BorderSide(color: Colors.red),
//                ),
                labelText: hint,
                labelStyle: TextStyle(
//                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.lightBlue,
                      width: 2.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
