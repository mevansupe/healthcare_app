import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Components/constants.dart';
import 'package:healthcareapp/Components/MspButton.dart';
import 'package:healthcareapp/Logic/Database.dart';

Database datab = Database();

class HospitalRegistration extends StatefulWidget {
  @override
  _HospitalRegistrationState createState() => _HospitalRegistrationState();
}

final nameController = TextEditingController();
final telController = TextEditingController();
final emailController = TextEditingController();
final cityController = TextEditingController();

String hospitalType = 'Genaral Hospital';

class _HospitalRegistrationState extends State<HospitalRegistration> {
  final _formKey = GlobalKey<FormState>();

  String validate(val, name) {
    if (val.isEmpty) {
      return 'Please enter your ${name}';
    }
    return null;
  }

  regHospital() async {
    if (_formKey.currentState.validate()) {
      Map<String, dynamic> hospitalData = {
        'name': nameController.text,
        'type': hospitalType,
        'tel': telController.text,
        'email': emailController.text,
        'city': cityController.text,
      };

      bool res = await datab.registerHospital(hospitalData);
      if (res) {
        await _successMsg();
        Navigator.pop(context);
      }
    }
  }

  Future<void> _successMsg() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registered'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Hospital Successfully Registered'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Hospital Registration'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FormTextBox(
                        validation: (val) {
                          return validate(val, "Name");
                        },
                        txtController: nameController,
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
                                underline: Container(
                                    color: Colors.lightBlue, height: 2.0),
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
                                    hospitalType = value;
                                  });
                                },
                                value: hospitalType,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormTextBox(
                        txtController: telController,
                        hint: "Telephone Number",
                        validation: (val) {
                          return validate(val, "Tel");
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormTextBox(
                        txtController: emailController,
                        hint: "Email Address",
                        validation: (val) {
                          return validate(val, "email");
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormTextBox(
                        txtController: cityController,
                        hint: "City",
                        validation: (val) {
                          return validate(val, "city");
                        },
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MspButton(
                color: Colors.lightBlue,
                title: "Register",
                onPressed: () {
                    regHospital();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FormTextBox extends StatelessWidget {
  FormTextBox(
      {@required this.hint,
      @required this.onChanged,
      this.txtController,
      this.validation});

  final String hint;
  final Function onChanged;
  final TextEditingController txtController;
  final Function validation;

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
              validator: validation,
              controller: txtController,
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
