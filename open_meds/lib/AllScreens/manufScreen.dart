import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_meds/AllScreens/msdScreen.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';

class ManufScreen extends StatefulWidget {
  @override
  _ManufScreenState createState() => _ManufScreenState();
}

class _ManufScreenState extends State<ManufScreen> {
  final licenseNoController = TextEditingController();
  final lotNoController = TextEditingController();
  final dateController = TextEditingController();
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
                    controller: dateController,
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
                  shape: RoundedRectangleBorder(side: BorderSide(
                      color: Color(0xFF6FCACE),
                      width: 1,
                      style: BorderStyle.solid
                  ), borderRadius: BorderRadius.circular(5)),
                  color: Color(0xFF6FCACE),
                  onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context) {
                        return AlertDialog(
                          // Retrieve the text that the user has entered by using the
                          // TextEditingController.
                          title: Text('Please Confirm Input'),
                          content: Text(
                              "License No. : " + licenseNoController.text + "\n" +
                              "Lot No. : " + lotNoController.text + "\n" +
                              "Expiry Date : " + dateController.text + "\n" +
                              "Location : " + locationController.text),
                          actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Continue'),
                                child: const Text('Continue'),
                              ),
                            ],
                        );
                      },
                      );//Send to Firebase
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
        dateController
          ..text = DateFormat.yMMMd().format(selectedDate)
          ..selection = TextSelection.fromPosition(TextPosition(
              offset: dateController.text.length,
              affinity: TextAffinity.upstream));
      });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dateController.dispose();
    licenseNoController.dispose();
    lotNoController.dispose();
    locationController.dispose();
    super.dispose();
  }

}