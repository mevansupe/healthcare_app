import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Logic/Database.dart';

Database datab = Database();

class Doctor_Appoinment_History extends StatefulWidget {
  Doctor_Appoinment_History({this.username});

  final username;

  @override
  _Doctor_Appoinment_HistoryState createState() => _Doctor_Appoinment_HistoryState();
}

class _Doctor_Appoinment_HistoryState extends State<Doctor_Appoinment_History> {
  List<Map<String, dynamic>> history = [];
  List<Widget> historyComponent = [
    SizedBox(
      height: 20,
    ),
  ];

  _gethistory() async {
    print(widget.username);
    history = await datab.getDocHistory(widget.username);
    _builComp();
    print("Done");
  }

  _makeAppoinment(name) async {
    Map<String, dynamic> appData = {
      'doctor': name,
      'username': widget.username,
      'completed': false,
    };

    bool res = await datab.makeAppoinment(appData, name);

    if (res) {
      await _successMsg();
      Navigator.pop(context);
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
                Text('Appinment Created'),
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
    history.forEach((v) => {
      historyComponent.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: 180,
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
                      "Patient ID : ${v["username"]}",
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Note : ${v["note"]}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Prescription : ${v["prescription"]}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  crossAxisAlignment: CrossAxisAlignment.end,
//                  children: <Widget>[
//                    FlatButton(
//                      color: Colors.blue,
//                      child: Text("Make Appoinment"),
//                      onPressed: () {
//                        _makeAppoinment(v["name"]);
//                      },
//                    ),
//                  ],
//                ),
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
        title: Text("Appointment History"),
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
