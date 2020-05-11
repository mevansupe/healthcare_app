import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Logic/Database.dart';
import 'package:healthcareapp/Screens/Payment.dart';

Database datab = Database();

class DoctorsNear extends StatefulWidget {
  DoctorsNear({this.location, this.spesiality, this.username, this.date});

  final username;
  final String location;
  final String spesiality;
  final String date;

  @override
  _DoctorsNearState createState() => _DoctorsNearState();
}

class _DoctorsNearState extends State<DoctorsNear> {
  List<Map<String, dynamic>> doctors = [];
  List<Widget> doctorsComponent = [
    SizedBox(
      height: 20,
    ),
  ];

  String validate(val, name) {
    if (val.isEmpty) {
      return 'Please enter your ${name}';
    }
    return null;
  }

  _getDoctors() async {
    print(widget.location);
    doctors = await datab.getNearDoctors(widget.location, widget.spesiality);
    _builComp();
    print("Done");
  }

  _makeAppoinment(name) async {
    Map<String, dynamic> appData = {
      'doctor': name,
      'username': widget.username,
      'date': widget.date,
      'completed': false,
    };

    bool res = await datab.makeAppoinment(appData, name);

    if (res) {
      await _successMsg();
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentScreen()));
    }
  }

  Future<void> _successMsg() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Appointment Created'),
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

  _builComp() {
    doctors.forEach((v) => {
          doctorsComponent.add(
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Doctor Name : ${v["name"]}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Contact : ${v["mobile"]}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.blue,
                          child: Text("Make Appoinment"),
                          onPressed: () {
                            _makeAppoinment(v["name"]);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          doctorsComponent.add(
            SizedBox(
              height: 20,
            ),
          ),
        });

    setState(() {
      doctorsComponent = doctorsComponent;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors Near By"),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Column(children: doctorsComponent),
        ],
      )),
    );
  }
}
