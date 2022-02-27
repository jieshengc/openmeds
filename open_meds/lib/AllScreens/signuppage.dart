import 'package:flutter/material.dart';
import 'package:open_meds/AllScreens/msdScreen.dart';

import 'package:open_meds/AllScreens/loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {

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
            SizedBox(height: 100),
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
            SizedBox(height: 40),
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
                        hintText: "Email",
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
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
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
                    hintText: "UEN",
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
                        hintText: "Verification Code",
                        hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 30,),
            Container(
                width: 250,
                height: 50,
                child: FlatButton(
                  child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 18)),
                  color: Color(0xFF6FCACE),
                  onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Your account is created!'),
                            content: Text('We will now direct you to the home page'),
                            actions: <Widget>[
                                TextButton(
                                  onPressed: () =>  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MSDScreen()))},
                                  child: const Text('Continue'),
                                ),
                              ],
                          );
                      },
                      );
                  },
                )
            ),
            FlatButton(
              child: Text('Login here!', style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF6FCACE))),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}