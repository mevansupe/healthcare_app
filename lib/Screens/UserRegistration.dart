import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:page_slider/page_slider.dart';
import 'package:healthcareapp/Components/MspButton.dart';
import 'package:healthcareapp/Logic/Database.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

Database datab = Database();

class UserRegistration extends StatefulWidget {
  final int mspreg;

  UserRegistration({this.mspreg});

  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

enum PhysicalDisorderSelector { yes, no }
enum MedicalAllergiesSelector { yes, no }

class _UserRegistrationState extends State<UserRegistration> {
  final _formKey = GlobalKey<FormState>();

  PhysicalDisorderSelector _character = PhysicalDisorderSelector.no;
  MedicalAllergiesSelector _medicalallegy = MedicalAllergiesSelector.no;

  String fName = "";
  String lName = "";
  String nic = "";
  String email = "";
  String mobile = "";
  String emergencyno = "";
  String phisicalDis = "";
  String medicalAllergy = "";
  String dob = "";

  TextEditingController dobController;
  TextEditingController fNameController;
  TextEditingController lNameController;
  TextEditingController nicController;
  TextEditingController emailController;
  TextEditingController mobileController;
  TextEditingController emergencyController;
  TextEditingController phisicalController;
  TextEditingController medicalController;

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
                Text('Registration Successfull!'),
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
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.mspreg == 1) {
      getUser();
    }
    
  }

  void getUser() async{
    var data = await datab.getUserDetails("chamara@gmail.com");
    data.forEach((v) => {
      print(v),
      setState(() {
          fNameController = TextEditingController(text: v["first_name"]);
          lNameController = TextEditingController(text: v["last_name"]);  
          nicController = TextEditingController(text: v["nic"]);  
          dobController = TextEditingController(text: v["dob"]);  
          emailController = TextEditingController(text: v["email"]);  
          mobileController = TextEditingController(text: v["mobile"]);  
          emergencyController = TextEditingController(text: v["emergency_no"]);  
          phisicalController = TextEditingController(text: v["phy_dis"]);  
          medicalController = TextEditingController(text: v["med_alergy"]);    
        })
      }
    );
  }

  void registerUser() async {

//    if (_formKey.currentState.validate()) {
//      Map<String, dynamic> userData = {
//        'username': email,
//        'password': nic,
//        'first_name': fName,
//        'last_name': lName,
//        'nic': nic,
//        'dob': dob,
//        'email': email,
//        'mobile': mobile,
//        'emergency_no': emergencyno,
//        'phy_dis': phisicalDis,
//        'med_alergy': medicalAllergy,
//      };
//
//      bool res = await datab.registerUser(userData);
//
//      if (res) {
//        await _successMsg();
//        Navigator.pop(context);
//      }
//    }
  }

  String validate(val, name) {
    if (val.isEmpty) {
      return 'Please enter your ${name}';
    }
    return null;
  }

  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: widget.mspreg == 0
            ? Text('User Registration')
            : Text('Edit Profile'),
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
                    txtController: fNameController,
                    hint: "First Name",
                    onChanged: (val) {
                      setState(() {
                        fName = val;
                      });
                    },
                    validation: (val) {
                      return validate(val, "First Name");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    txtController: lNameController,
                    hint: "Last Name",
                    onChanged: (val) {
                      setState(() {
                        lName = val;
                      });
                    },
                    validation: (val) {
                      return validate(val, "Last Name");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    txtController: nicController,
                    hint: "NIC",
                    onChanged: (val) {
                      setState(() {
                        nic = val;
                      });
                    },
                    validation: (val) {
                      return validate(val, "NIC");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: _dateTime == null
                                  ? DateTime.now()
                                  : _dateTime,
                              firstDate: DateTime(1930),
                              lastDate: DateTime(2021))
                          .then((date) {
                        setState(() {
                          _dateTime = date;
                          final f = new DateFormat('yyyy-MM-dd');
                          dob = f.format(date);
                          dobController = TextEditingController(text: dob);
                        });
                      });
                    },
                  ),
                  FormTextBox(
                    txtController: dobController,
                    hint: "Date of birth",
                    validation: (val) {
                      return validate(val, "Date of birth");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    txtController: emailController,
                    hint: "Email Address",
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    validation: (val) {
                      return validate(val, "Email");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    txtController: mobileController,
                    hint: "Mobile Number",
                    onChanged: (val) {
                      setState(() {
                        mobile = val;
                      });
                    },
                    validation: (val) {
                      return validate(val, "Mobile");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    txtController: emergencyController,
                    hint: "Emergency Number",
                    onChanged: (val) {
                      setState(() {
                        emergencyno = val;
                      });
                    },
                    validation: (val) {
                      return validate(val, "An Emergency number");
                    },
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
                          onChanged: (val) {
                            setState(() {
                              phisicalDis = val;
                            });
                          },
                          validation: (val) {
                            return validate(val, "Disorder");
                          },
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
                          onChanged: (val) {
                            setState(() {
                              medicalAllergy = val;
                            });
                          },
                          validation: (val) {
                            return validate(val, "Allergies");
                          },
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
                            title: widget.mspreg == 0 ? "Register" : "Update",
                            onPressed: () {
                              registerUser();
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
