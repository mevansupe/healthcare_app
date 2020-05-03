import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Components/constants.dart';
import 'package:healthcareapp/Components/MspButton.dart';

class HospitalRegistration extends StatefulWidget {
  @override
  _HospitalRegistrationState createState() => _HospitalRegistrationState();
}

enum PhysicalDisorderSelector { yes, no }
enum MedicalAllergiesSelector { yes, no }

String selectedfrom = 'Genaral Hospital';

class _HospitalRegistrationState extends State<HospitalRegistration> {
  final _formKey = GlobalKey<FormState>();
  PhysicalDisorderSelector _character = PhysicalDisorderSelector.no;
  MedicalAllergiesSelector _medicalallegy = MedicalAllergiesSelector.no;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Hospital Registration'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FormTextBox(
                    hint: "Name",
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
                            hint: Text('Select From or To'),
                            isExpanded: true,
                            items: <DropdownMenuItem<String>>[
                              DropdownMenuItem(
                                child: Text(
                                  'Genaral Hospital',
                                  style: DdItm,
                                ),
                                value: 'Genaral Hospital',
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
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    hint: "Telephone Number",
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
