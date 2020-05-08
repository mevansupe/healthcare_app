import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Components/constants.dart';
import 'package:healthcareapp/Components/MspButton.dart';
import 'package:healthcareapp/Logic/Database.dart';

Database datab = Database();

class DoctorRegistration extends StatefulWidget {
  @override
  _DoctorRegistrationState createState() => _DoctorRegistrationState();
}

final nameController = TextEditingController();
final ageController = TextEditingController();
final emailController = TextEditingController();
final mobileController = TextEditingController();
final descController = TextEditingController();
final cityController = TextEditingController();

class _DoctorRegistrationState extends State<DoctorRegistration> {
  final _formKey = GlobalKey<FormState>();

  String spesiality = 'Neurologist';

  String validate(val, name) {
    if (val.isEmpty) {
      return 'Please enter your ${name}';
    }
    return null;
  }

  regDoctor() async {
    if (_formKey.currentState.validate()) {
      Map<String, dynamic> doctorData = {
        'name': nameController.text,
        'age': ageController.text,
        'speciality': spesiality,
        'email': emailController.text,
        'mobile': mobileController.text,
        'desc': descController.text,
        'city': cityController.text,
      };

      bool res = await datab.registerDoctor(doctorData);
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
                Text('Doctor Successfully Registered'),
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

  List<DropdownMenuItem<String>> docSpecialities = [
    DropdownMenuItem(
      child: Text('Dental',style: DdItm,),
      value: 'Dental',
    ),
    DropdownMenuItem(
      child: Text('Demotology',style: DdItm,),
      value: 'Demotology',
    ),
    DropdownMenuItem(
      child: Text('Ear',style: DdItm,),
      value: 'Ear',
    ),
    DropdownMenuItem(
      child: Text('Nose',style: DdItm,),
      value: 'Nose',
    ),
    DropdownMenuItem(
      child: Text('Throat',style: DdItm,),
      value: 'Throat',
    ),
    DropdownMenuItem(
      child: Text('Family phisisian',style: DdItm,),
      value: 'Family_phisisian',
    ),
    DropdownMenuItem(
      child: Text('Anesthelogist',style: DdItm,),
      value: 'Anesthelogist',
    ),
    DropdownMenuItem(
      child: Text('Gastrologist',style: DdItm,),
      value: 'Gastrologist',
    ),
    DropdownMenuItem(
      child: Text('Neurologist',style: DdItm,),
      value: 'Neurologist',
    ),
    DropdownMenuItem(
      child: Text('Genaral phisisian',style: DdItm,),
      value: 'Genaral_phisisian',
    ),
    DropdownMenuItem(
      child: Text('Gynaecologist',style: DdItm,),
      value: 'Gynaecologist',
    ),
    DropdownMenuItem(
      child: Text('Haemotologist',style: DdItm,),
      value: 'Haemotologist',
    ),
  ];


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
                    txtController: nameController,
                    hint: "Name",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    txtController: ageController,
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
                            items: docSpecialities,
                            onChanged: (value) {
                              setState(() {
                                spesiality = value;
                                print(spesiality);
                              });
                            },
                            value: spesiality,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FormTextBox(
                    txtController: emailController,
                    hint: "Email Address",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    txtController: mobileController,
                    hint: "Mobile",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    txtController: descController,
                    hint: "Description",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    txtController: cityController,
                    hint: "City",
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ],
          ),
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
                  regDoctor();
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
