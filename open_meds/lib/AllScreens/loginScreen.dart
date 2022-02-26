import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_meds/AllScreens/signuppage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
                  width: 300,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Company Name",
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
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            Container(
              width: 250,
              //height: 50,
              child: FlatButton(
                child: Text('Login'),
                color: Color(0xFF04948E),
                onPressed: (){
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              )
            ),
            SizedBox(height: 10),
            Container(
              //width: 250,
              //height: 50,
              child: FlatButton(
                child: Text('Register here!', style: TextStyle(decoration: TextDecoration.underline)),
                //color: Color(0xFF04948E),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              )
            ),
            //Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1), decoration: TextDecoration.underline),),
          ],
        ),
      ),
    );
  }
}