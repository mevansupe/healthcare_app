import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Logic/Database.dart';

Database datab = Database();

class DoctorUpcomming_Appoinments extends StatefulWidget {
  DoctorUpcomming_Appoinments({this.username});

  final username;

  @override
  _DoctorUpcomming_AppoinmentsState createState() =>
      _DoctorUpcomming_AppoinmentsState();
}

class _DoctorUpcomming_AppoinmentsState
    extends State<DoctorUpcomming_Appoinments> {
  List<Map<String, dynamic>> history = [];
  List<Widget> historyComponent = [
    SizedBox(
      height: 20,
    ),
  ];

  _gethistory() async {
    print(widget.username);
    history = await datab.getDoctorUpcomming(widget.username);
    _builComp();
    print("Done");
  }

  _makeAppoinment(id) async {
    if (_formKey.currentState.validate()) {
      Map<String, dynamic> appData = {
        'prescription': prescriptionController.text,
        'note': doctorsnoteController.text,
        'completed': true,
      };

      bool res = await datab.confirmAppointment(appData, id);

      if (res) {
        await _successMsg();
        await _gethistory();
        Navigator.pop(context);
        Navigator.pop(context);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  final doctorsnoteController = TextEditingController();
  final prescriptionController = TextEditingController();

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
                Text('Appointment Finished'),
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

  String validate(val, name) {
    if (val.isEmpty) {
      return 'Please enter your ${name}';
    }
    return null;
  }

  _detailsmodal(id, context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc) {
      return Container(
        height: 1000,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  FormTextBox(
                    txtController: doctorsnoteController,
                    hint: "Doctor's Note",
                    onChanged: (val) {

                    },
                    validation: (val) {
                      return validate(val, "Doctor's Note");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormTextBox(
                    txtController: prescriptionController,
                    hint: "Prescription",
                    validation: (val) {
                      return validate(val, "Prescription");
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.blue,
                          child: Text("Finish"),
                          onPressed: () {
                            _makeAppoinment(id);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _builComp() {
    history.forEach((v) => {
          historyComponent.add(
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
                          "Patient id : ${v["username"]}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Date : ${v["date"]}",
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
                          child: Text("Confirm Appoinment"),
                          onPressed: () {
                            _detailsmodal(v["_id"],context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          historyComponent.add(
            SizedBox(
              height: 20,
            ),
          ),
        });

    setState(() {
      historyComponent = historyComponent;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gethistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming Appointments"),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Column(children: historyComponent),
        ],
      )),
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