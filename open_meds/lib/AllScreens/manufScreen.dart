import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_meds/AllScreens/msdScreen.dart';
import 'package:date_time_picker/date_time_picker.dart';

class ManufScreen extends StatefulWidget {
  @override
  _ManufScreenState createState() => _ManufScreenState();
}

class _ManufScreenState extends State<ManufScreen> {
  final licenseNoController = TextEditingController();
  final lotNoController = TextEditingController();
  DateTime selectedDate = DateTime.now();
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Expiry Date: " + "${selectedDate.toLocal()}".split(' ')[0],
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      suffixIcon: IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(Icons.keyboard_arrow_down),
                      ),
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
                        hintText: "Manufacturing Location",
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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