import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_meds/AllScreens/loginScreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

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
              height: 180,
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
                    child: Text('Check Product',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 18)),
                    color: Color(0xFF04948E),
                    onPressed: () { 
                    },
                  )
                ),
                SizedBox(height: 30),
                Container(
                  width: 250,
                  height: 80,
                  child: FlatButton(
                    child: Text('Manufacturer/Supplier/Distributor Login', 
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 18)),
                    color: Color(0xFF04948E),
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