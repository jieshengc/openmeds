import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_meds/AllScreens/loginScreen.dart';
import 'package:open_meds/AllScreens/signuppage.dart';
import 'package:open_meds/AllScreens/suppdistScreen.dart';
import 'package:open_meds/AllScreens/manufScreen.dart';


class MSDScreen extends StatefulWidget {
  @override
  _MSDScreenState createState() => _MSDScreenState();
}

class _MSDScreenState extends State<MSDScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 150),
            Container(
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo.jpeg'),
                        fit: BoxFit.fill
                    )
                )
            ),
            SizedBox(height: 20),
            Column(
              children: <Widget>[
                Container(
                    width: 250,
                    height: 80,
                    child: FlatButton(
                      child: Text('Add Drug (Manufacturer)',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      color: Color(0xFF6FCACE),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                ManufScreen()
                          )
                        );
                      },
                    )
                ),
                SizedBox(height: 30),
                Container(
                    width: 250,
                    height: 80,
                    child: FlatButton(
                      child: Text('Update Drug Status (Supplier/Distributor)',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      color: Color(0xFF6FCACE),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SuppDistScreen()
                            )
                        );
                      },
                    )
                ),
                SizedBox(height: 30),
                Container(
                    width: 250,
                    height: 80,
                    child: FlatButton(
                      child: Text('Logout',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      color: Color(0xFF6FCACE),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                  LoginScreen()
                            )
                        );
                      },
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}