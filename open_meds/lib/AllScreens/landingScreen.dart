import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_meds/AllScreens/consumerScreen.dart';
import 'package:open_meds/AllScreens/loginScreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // Create a text controller and use it to retrieve the current value of the TextField.
  final myController = TextEditingController();

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
                Text('For Consumers',textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 250,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Serial No.",
                          hintStyle: TextStyle(color: Colors.grey[400])
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context, 
                            MaterialPageRoute(
                                builder: (context) =>
                                    ConsumerScreen()
                              )
                          );
                        }, 
                        icon: Icon(Icons.keyboard_arrow_right)
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Text('For Companies',textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  height: 80,
                  child: FlatButton(
                    child: Text('Manufacturer/Supplier/Distributor Login', 
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

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
}