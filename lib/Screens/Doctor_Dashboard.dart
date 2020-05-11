import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Screens/Doctor_Appoinment_History.dart';
import 'package:healthcareapp/Screens/Doctor_Upcomming_Appoingments.dart';

class DoctorDashboard extends StatefulWidget {

  final username;

  DoctorDashboard({this.username});

  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {

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
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ContainerComponent(
                      onpressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Doctor_Appoinment_History(username: widget.username,)));
                      },
                      icon: Icons.restore_page,
                      text: "History",
                    ),
                    ContainerComponent(
                      icon: Icons.schedule,
                      text: "Upcomming \n Appoinments",
                      onpressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorUpcomming_Appoinments(username: widget.username,)));
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}

class ContainerComponent extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onpressed;
  ContainerComponent({this.text,this.icon, this.onpressed});

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
                color: Colors.white
              ),
            ),
          ],
        ),
        width: 170,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xff0a96fa)
        ),
      ),
    );
  }
}