import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Logic/Database.dart';

Database datab = Database();

class View_Hospitals extends StatefulWidget {
  View_Hospitals({this.username});

  final username;

  @override
  _View_HospitalsState createState() => _View_HospitalsState();
}

class _View_HospitalsState extends State<View_Hospitals> {
  List<Map<String, dynamic>> history = [];
  List<Widget> historyComponent = [
    SizedBox(
      height: 20,
    ),
  ];

  _gethistory() async {
    print(widget.username);
    history = await datab.getHospitals();
    _builComp();
    print("Done");
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
                      "Hospital Name : ${v["name"]}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Type : ${v["type"]}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Land : ${v["tel"]}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Email : ${v["email"]}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "City : ${v["city"]}",
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
        title: Text("Hospitals"),
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
