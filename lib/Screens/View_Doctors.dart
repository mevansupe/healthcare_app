import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Logic/Database.dart';

Database datab = Database();

class View_Doctors extends StatefulWidget {
  View_Doctors({this.username});

  final username;

  @override
  _View_DoctorsState createState() => _View_DoctorsState();
}

class _View_DoctorsState extends State<View_Doctors> {
  List<Map<String, dynamic>> history = [];
  List<Widget> historyComponent = [
    SizedBox(
      height: 20,
    ),
  ];

  _gethistory() async {
    print(widget.username);
    history = await datab.getDoctors();
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
                      "Doctor Name : ${v["name"]}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Specialized in : ${v["speciality"]}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Mobile : ${v["mobile"]}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description : ${v["desc"]}",
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
        title: Text("Doctors"),
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
