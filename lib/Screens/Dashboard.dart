import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:healthcareapp/Screens/UserRegistration.dart';
import 'package:healthcareapp/Screens/New_Appoinment.dart';
import 'package:healthcareapp/Screens/Appoinment_History.dart';
import 'package:healthcareapp/Screens/Upcomming_Appoingments.dart';
import 'package:healthcareapp/Screens/View_Hospitals.dart';
import 'package:healthcareapp/Screens/View_Doctors.dart';
import 'dart:async';

class Dashboard extends StatefulWidget {
  final username;

  Dashboard({this.username});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
      new OrdinalSales('2018', 49),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  List<String> healthTips = [
    "Avoid tobacco",
    "Avoid unnecessary exposure to radiation",
    "Eat properly",
    "Get regular medical care",
    "Keep tabs on your blood pressure",
    "Mind your blood sugar",
    "Be smart about cholesterol",
    "Eat to be your best",
    "Lose extra weight",
    "Check your blood sugar level at least twice a day",
    "Regular exercises",
    "Avoiding sugary foods and carbohydrates",
    "Reduce your stress",
    "Exercise regularly and eat a healthy diet",
    "Monitor your blood pressure at home and see your doctor regularly",
    "Reduce sodium in your diet",
    "Get plenty of rest and drink plenty of fluids",
    "Avoid touching your eyes, nose or mouth. Germs spread this way",
    "Wash your hands often with soap and water",
    "Cover your nose and mouth with a tissue when you cough",
    "Don’t drink sugar calories",
    "Avoid processed junk food",
    "Drink some water, especially before meals",
    "Eat vegetables and fruits",
    "Do some cardio",
    "Don’t smoke or do drugs, and only drink in moderation",
    "Use plenty of herbs and spices"
  ];
  int tip_id = 0;
  String tip = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        tip = healthTips[tip_id];
        if (tip_id < healthTips.length - 1) {
          tip_id++;
        } else {
          tip_id = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Welcome!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Health Tip",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      tip,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
//                Container(
//                  height: 250,
//                  width: 350,
//                  child: SimpleBarChart(
//                    _createSampleData(),
//                    // Disable animations for image tests.
//                    animate: false,
//                  ),
//                ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ContainerComponent(
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => UserRegistration(
                                    mspreg: 1,
                                  )));
                    },
                    icon: Icons.person,
                    text: "Edit Profile",
                  ),
                  ContainerComponent(
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => New_Appoinment(
                                    username: widget.username,
                                  )));
                    },
                    icon: Icons.add,
                    text: "Place \n Appointments",
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ContainerComponent(
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Appoinment_History(
                                    username: widget.username,
                                  )));
                    },
                    icon: Icons.restore_page,
                    text: "History",
                  ),
                  ContainerComponent(
                    icon: Icons.schedule,
                    text: "Upcomming \n Appoinments",
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Upcomming_Appoinments(
                                    username: widget.username,
                                  )));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ContainerComponent(
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => View_Hospitals()));
                    },
                    icon: Icons.local_hospital,
                    text: "View Hospitals",
                  ),
                  ContainerComponent(
                    icon: Icons.person,
                    text: "View Doctors",
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => View_Doctors()));
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class ContainerComponent extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onpressed;

  ContainerComponent({this.text, this.icon, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 120,
              color: Colors.white,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        width: 170,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xff0a96fa)),
      ),
    );
  }
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
