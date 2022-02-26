import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_meds/AllScreens/msdScreen.dart';

class SuppDistScreen extends StatefulWidget {
  @override
  _SuppDistScreenState createState() => _SuppDistScreenState();
}

class _SuppDistScreenState extends State<SuppDistScreen> {
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
                  width: 300,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Licence No.",
                        hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Lot No.",
                        hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Location of Supplier/Distributor",
                        hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            Container(
                width: 250,
                height: 50,
                child: FlatButton(
                  child: Text('Done', style: TextStyle(color: Colors.white, fontSize: 18)),
                  color: Color(0xFF6FCACE),
                  onPressed: (){
                    //Send to Firebase
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            MSDScreen()
                        )
                    );
                  },
                )
              )
            ],
        ),
      ),
    );
  }
}