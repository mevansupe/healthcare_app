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
        backgroundColor: Color.fromRGBO(248, 12, 68, 100),
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
                      children: <Widget>[Text("Physical Disorder")],
                    ),
                  ),
                  ListTile(
                    title: const Text('Yes'),
                    leading: Radio(
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
                      value: PhysicalDisorderSelector.no,
                      groupValue: _character,
                      onChanged: (PhysicalDisorderSelector value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  _character == PhysicalDisorderSelector.yes ?
                  FormTextBox(
                    hint: "Physical Disorder",
                  ) : SizedBox(),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: const Text('Yes'),
                    leading: Radio(
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
                      value: MedicalAllergiesSelector.no,
                      groupValue: _medicalallegy,
                      onChanged: (MedicalAllergiesSelector value) {
                        setState(() {
                          _medicalallegy = value;
                        });
                      },
                    ),
                  ),
                  _medicalallegy == MedicalAllergiesSelector.yes ?
                  FormTextBox(
                    hint: "Medical Allergies",
                  ) : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: MspButton(
                            color: Color.fromRGBO(248, 12, 68, 100),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
