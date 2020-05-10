import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Components/constants.dart';
import 'package:healthcareapp/Components/MspButton.dart';
import 'package:healthcareapp/Logic/Database.dart';
import 'package:healthcareapp/Screens/Doctors_Near_By.dart';
import 'package:intl/intl.dart';

Database datab = Database();

class New_Appoinment extends StatefulWidget {
  final username;

  New_Appoinment({this.username});

  @override
  _New_AppoinmentState createState() => _New_AppoinmentState();
}

class _New_AppoinmentState extends State<New_Appoinment> {
  final _formKey = GlobalKey<FormState>();

  String spesiality = 'Neurologist';
  String city = 'city';

  String validate(val, name) {
    if (val.isEmpty) {
      return 'Please enter your ${name}';
    }
    return null;
  }

//  void _getLocations() async {
//    var data = await datab.getLocations();
//    data.forEach((v) => {
//        locations.add(
//          DropdownMenuItem(
//            child: Text(v["city"],style: DdItm,),
//            value: v["city"],
//          ),
//        )
//    });
//
//    setState(() {
//      locations = locations;
//    });
//
//  }

  List<DropdownMenuItem<String>> locations = [
    DropdownMenuItem(
      child: Text('City',style: DdItm,),
      value: 'city',
    ),
    DropdownMenuItem(
      child: Text('Gampola',style: DdItm,),
      value: 'Gampola',
    ),
    DropdownMenuItem(
      child: Text('Peradeniya',style: DdItm,),
      value: 'Peradeniya',
    ),
    DropdownMenuItem(
      child: Text('Kandy',style: DdItm,),
      value: 'Kandy',
    ),
    DropdownMenuItem(
      child: Text('Kegalle',style: DdItm,),
      value: 'Kegalle',
    ),
    DropdownMenuItem(
      child: Text('Gampaha',style: DdItm,),
      value: 'Gampaha',
    ),
    DropdownMenuItem(
      child: Text('Colombo',style: DdItm,),
      value: 'Colombo',
    ),
    DropdownMenuItem(
      child: Text('Kurunagala',style: DdItm,),
      value: 'Kurunagala',
    ),
    DropdownMenuItem(
      child: Text('Dambulla',style: DdItm,),
      value: 'Dambulla',
    ),
    DropdownMenuItem(
      child: Text('Anuradhapura',style: DdItm,),
      value: 'Anuradhapura',
    ),
    DropdownMenuItem(
      child: Text('Vauniya',style: DdItm,),
      value: 'Vauniya',
    ),
    DropdownMenuItem(
      child: Text('Jaffna',style: DdItm,),
      value: 'Jaffna',
    ),
    DropdownMenuItem(
      child: Text('Matara',style: DdItm,),
      value: 'Matara',
    ),
    DropdownMenuItem(
      child: Text('Galle',style: DdItm,),
      value: 'Galle',
    ),
    DropdownMenuItem(
      child: Text('Hambanthota',style: DdItm,),
      value: 'Hambanthota',
    ),
    DropdownMenuItem(
      child: Text('Trincomalee',style: DdItm,),
      value: 'Trincomalee',
    ),
    DropdownMenuItem(
      child: Text('Batticaloa',style: DdItm,),
      value: 'Batticaloa',
    ),
    DropdownMenuItem(
      child: Text('Polonnaruwa',style: DdItm,),
      value: 'Polonnaruwa',
    ),
  ];

  List<DropdownMenuItem<String>> docSpecialities = [
    DropdownMenuItem(
      child: Text('Consultant Respiratory Physician',style: DdItm,),
      value: 'Consultant_Respiratory_Physician',
    ),
    DropdownMenuItem(
      child: Text('Pathologist',style: DdItm,),
      value: 'Pathologist',
    ),
    DropdownMenuItem(
      child: Text('Dermotologist',style: DdItm,),
      value: 'Dermotologist',
    ),
    DropdownMenuItem(
      child: Text('Hepatologist',style: DdItm,),
      value: 'Hepatologist',
    ),
    DropdownMenuItem(
      child: Text('Gastroenterologist',style: DdItm,),
      value: 'Gastroenterologist',
    ),
    DropdownMenuItem(
      child: Text('Family Physician',style: DdItm,),
      value: 'Family_physician',
    ),
    DropdownMenuItem(
      child: Text('Nephrologist',style: DdItm,),
      value: '	Nephrologist',
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
      child: Text('Genaral Phycisian',style: DdItm,),
      value: 'Genaral_Phycisian',
    ),
    DropdownMenuItem(
      child: Text('Gynaecologist',style: DdItm,),
      value: 'Gynaecologist',
    ),
    DropdownMenuItem(
      child: Text('Haemotologist',style: DdItm,),
      value: 'Haemotologist',
    ),
    DropdownMenuItem(
      child: Text('Paediatric Surgeon',style: DdItm,),
      value: 'Paediatric_Surgeon',
    ),
    DropdownMenuItem(
      child: Text('Urologist',style: DdItm,),
      value: 'Urologist',
    ),
    DropdownMenuItem(
      child: Text('Eye Surgeon',style: DdItm,),
      value: 'Eye_Surgeon',
    ),
    DropdownMenuItem(
      child: Text('General Physiciian',style: DdItm,),
      value: 'General_Physiciian',
    ),
    DropdownMenuItem(
      child: Text('Cardiologist',style: DdItm,),
      value: 'Family_phisisian',
    ),
    DropdownMenuItem(
      child: Text('Anesthelogist',style: DdItm,),
      value: 'Anesthelogist',
    ),
    DropdownMenuItem(
      child: Text('Respiratory Physician',style: DdItm,),
      value: 'Respiratory_Physician',
    ),
    DropdownMenuItem(
      child: Text('Physiologist',style: DdItm,),
      value: 'Physiologist',
    ),
    DropdownMenuItem(
      child: Text('Pathologist',style: DdItm,),
      value: 'Pathologist',
    ),
    DropdownMenuItem(
      child: Text('Orthodontist',style: DdItm,),
      value: 'Orthodontist',
    ),
    DropdownMenuItem(
      child: Text('Dentist',style: DdItm,),
      value: 'Dentist',
    ),
    DropdownMenuItem(
      child: Text('Nutritionist',style: DdItm,),
      value: 'Nutritionist',
    ),
    DropdownMenuItem(
      child: Text('Eye Surgeon',style: DdItm,),
      value: 'Eye_Surgeon',
    ),
    DropdownMenuItem(
      child: Text('ENT Surgeon',style: DdItm,),
      value: 'ENT_Surgeon',
    ),
    DropdownMenuItem(
      child: Text('Skin',style: DdItm,),
      value: 'Skin',
    ),
    DropdownMenuItem(
      child: Text('Immunologist',style: DdItm,),
      value: 'Immunologist',
    ),
    DropdownMenuItem(
      child: Text('Diabetologist',style: DdItm,),
      value: 'Diabetologist',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _getLocations();
  }

  DateTime _dateTime;
  final DateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Make Appoinment'),
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
                  Text(
                    "Doctor Specialization",
                    textAlign: TextAlign.left,
                    style: TextStyle(
//                    color: Colors.lightBlue,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: DropdownButton<String>(
                            underline:
                                Container(color: Colors.lightBlue, height: 2.0),
                            iconEnabledColor: Colors.blueAccent,
                            iconSize: 30.0,
                            hint: Text('Doctor Specialization'),
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
                  Text(
                    "Location",
                    textAlign: TextAlign.left,
                    style: TextStyle(
//                    color: Colors.lightBlue,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: DropdownButton<String>(
                            underline:
                                Container(color: Colors.lightBlue, height: 2.0),
                            iconEnabledColor: Colors.blueAccent,
                            iconSize: 30.0,
                            hint: Text('Location'),
                            isExpanded: true,
                            items: locations,
                            onChanged: (value) {
                              setState(() {
                                city = value;
                                print(city);
                              });
                            },
                            value: city,
                          ),
                        ),
                      ],
                    ),
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
                          DateController..text = f.format(date);
                        });
                      });
                    },
                  ),
                  FormTextBox(
                    txtController: DateController,
                    hint: "Date",
                    validation: (val) {
                      return validate(val, "Date");
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
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
                title: "Find Doctor",
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DoctorsNear(
                                  spesiality: spesiality,
                                  location: city,
                                  username: widget.username,
                                  date: DateController.text,
                                )));
                  }
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
