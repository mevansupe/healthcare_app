import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/Components/MspButton.dart';
import 'package:healthcareapp/Screens/UserRegistration.dart';
import 'package:healthcareapp/Logic/Database.dart';
import 'package:healthcareapp/Screens/Dashboard.dart';
import 'package:healthcareapp/Screens/DoctorRegistration.dart';
import 'package:healthcareapp/Screens/HospitalRegistration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healthcareapp/Screens/Doctor_Dashboard.dart';

Database datab = Database();

class LoginPage extends StatefulWidget {
  static String id = "LoginPage";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String pass;
  String username;

  login() async {
    if (_formKey.currentState.validate()) {
      int logged = await datab.loginUser(email, pass);
      print(logged);

      if (logged == 0) {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: <Widget>[
                  Icon(Icons.error, color: Colors.red,),
                  SizedBox(width: 10,),
                  Text('Error')
                ],
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Username or password is incorrect', textAlign: TextAlign.center,),
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
      } else {
        if (logged == 1) {
          await _logDetails();
//          await _getlogin();
          Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard(username: username)));
        } else if (logged == 2) {
          await _logDetails();
//          await _getlogin();
          Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorDashboard(username: email,)));
        }
      }
    }
  }

  String validate(val, name) {
    if (val.isEmpty) {
      return 'Please enter your ${name}';
    }
    return null;
  }

  _logDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', email);
    username = prefs.getString('username');
    print(username);
  }

   _getlogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    SharedPreferences.setMockInitialValues({});
    try {
      String username = prefs.getString('username');
      print(username);
      if (username != null) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard(username: username,)));
      } else {
        print("not logged in");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getlogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Image(image: AssetImage('Images/leee.png')),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 20),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            size: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                              validator: (val) {
                                return validate(val, "Username");
                              },
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 18),
                                hintText: "Username",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 20, top: 20),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.vpn_key,
                            size: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              obscureText: true,
                              onChanged: (val) {
                                setState(() {
                                  pass = val;
                                });
                              },
                              validator: (val) {
                                return validate(val, "Password");
                              },
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 18),
                                hintText: "Password",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Forgot Password ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue.shade900, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: MspButton(
                              color: Colors.red,
                              title: "Login",
                              onPressed: () {
                                login();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Not registered? ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 18),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => UserRegistration(
                                                mspreg: 0,
                                              )));
                                    },
                                    child: Text(
                                      "Register As User",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontSize: 14),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => HospitalRegistration()));
                                    },
                                    child: Text(
                                      "Register As Hospital",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontSize: 14),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DoctorRegistration()));
                                    },
                                    child: Text(
                                      "Register As Doctor",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
