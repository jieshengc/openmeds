import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_meds/DataModel/consumerInput.dart';

class consumerScreen extends StatefulWidget {
  @override
  _consumerScreenState createState() => _consumerScreenState();
}


class _consumerScreenState extends State<consumerScreen> {

  List<Person> persons = [
    Person(name: 'Bill Will', profileImg: 'img/pic-1.png', bio: "Software Developer"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.black,),
            onPressed:() => Navigator.pop(context),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo.jpeg',
                fit: BoxFit.contain,
                height: 125, width:200,
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Authenticate?',
                  style: TextStyle (
                      fontSize: 40,
                          fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                          ListTile(
                          title: Text('Current Destination'),
                          subtitle: Text("Input data"),//detail.<>),
                        ),
                              ]
                      ),
                      ),
                  ),
                ),
          ]
                ),
                Column(
                    children: persons.map((p) {
                      return detailCard(p);
                    }).toList()
                )
          ]
            ),
        ),
          ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Check Drug'),
        icon: const Icon(Icons.add_a_photo),
        backgroundColor: Color(0xFF6FCACE),
        hoverColor: Colors.green[800],
        onPressed: (){},
      ),
    );
  }

  Widget detailCard(detail) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(

                    title: Text('Location History'),
                    subtitle: Text("Input data"),//detail.<>),
                  ),
                    ListTile(
                      title: Text('Name'),
                      subtitle: Text("Input data"),//detail.<>),
                    ),
        ListTile(
          title: Text('Batch Number'),
          subtitle: Text("Input data"),//detail.<>),
        ),
        ListTile(
          title: Text('Expiry Date'),
          subtitle: Text("Input data"),//detail.<>),
        ),
        ListTile(
          title: Text('Ingredients'),
          subtitle: Text("Input data"),//detail.<>),
        ),

                ],
              ),
            ),
          ),
    );
  }
}