import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Components/constants.dart';
import 'package:healthcareapp/Components/MspButton.dart';

class DoctorRegistration extends StatefulWidget {
  @override
  _DoctorRegistrationState createState() => _DoctorRegistrationState();
}

enum PhysicalDisorderSelector { yes, no }
enum MedicalAllergiesSelector { yes, no }

String selectedfrom = 'Neurologist';

class _DoctorRegistrationState extends State<DoctorRegistration> {
  final _formKey = GlobalKey<FormState>();
  PhysicalDisorderSelector _character = PhysicalDisorderSelector.no;
  MedicalAllergiesSelector _medicalallegy = MedicalAllergiesSelector.no;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Doctor Registration'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "Name",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "Age",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: DropdownButton<String>(
                            underline:
                            Container(color: Colors.lightBlue, height: 2.0),
                            iconEnabledColor: Colors.blueAccent,
                            iconSize: 30.0,
                            hint: Text('Speasialist in'),
                            isExpanded: true,
                            items: <DropdownMenuItem<String>>[
                              DropdownMenuItem(
                                child: Text(
                                  'Neurologist',
                                  style: DdItm,
                                ),
                                value: 'Neurologist',
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedfrom = value;
                              });
                            },
                            value: selectedfrom,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FormTextBox(
                    hint: "Email Address",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "Mobile",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "Description",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "City",
                  ),
                ],
              ),
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
              style: TextStyle(fontSize: 18, letterSpacing: 0.8),
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
                  borderSide:
                  const BorderSide(color: Colors.lightBlue, width: 2.0),
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
