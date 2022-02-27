import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_meds/AllScreens/msdScreen.dart';

class SuppDistScreen extends StatefulWidget {
  @override
  _SuppDistScreenState createState() => _SuppDistScreenState();
}

class _SuppDistScreenState extends State<SuppDistScreen> {
  final licenseNoController = TextEditingController();
  final lotNoController = TextEditingController();
  final locationController = TextEditingController();

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
                    controller: licenseNoController,
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
                    controller: lotNoController,
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
                    controller: locationController,
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
                    shape: RoundedRectangleBorder(side: BorderSide(
                        color: Color(0xFF6FCACE),
                        width: 1,
                        style: BorderStyle.solid
                    ), borderRadius: BorderRadius.circular(5)),
                  color: Color(0xFF6FCACE),
                  onPressed: () {
                    //Send to Firebase
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text that the user has entered by using the
                          // TextEditingController.
                          title: Text('Please Confirm Input'),
                          content: Text(
                              "License No. : " + licenseNoController.text +
                                  "\n" +
                                  "Lot No. : " + lotNoController.text + "\n" +
                                  "Location : " + locationController.text),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => {
                                Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MSDScreen()
                                  )
                                )
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                )
              )
            ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    licenseNoController.dispose();
    lotNoController.dispose();
    locationController.dispose();
    super.dispose();
  }
}