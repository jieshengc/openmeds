import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_meds/DataModel/consumerInput.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_meds/AllScreens/imageScreen.dart';

final ImagePicker _picker = ImagePicker();

class ConsumerScreen extends StatefulWidget {
  @override
  _ConsumerScreenState createState() => _ConsumerScreenState();
}


class _ConsumerScreenState extends State<ConsumerScreen> {

  List<Person> persons = [
    Person(name: 'Bill Will', profileImg: 'img/pic-1.png', bio: "Software Developer"),
  ];
  /// Variables
  late File imageFile;
  String drugState = "";
  String serial = "";

  @override
  void initState() {
    // TODO: implement initState
    drugState = "Real";
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
                if (drugState == "Real") ...[
                  Text("${drugState}",
                    style: TextStyle (
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                    ),
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
                                  subtitle: Text("Singapore"),//detail.<>),
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
                  ),
                  Container(
                        width: 220,
                        height: 40,
                        child: FlatButton(
                            child: Text('Image Similarity Check',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 18)),
                                shape: RoundedRectangleBorder(side: BorderSide(
                                    color: Color(0xFF6FCACE),
                                    width: 1,
                                    style: BorderStyle.solid
                                ), borderRadius: BorderRadius.circular(5)),
                            color: Color(0xFF6FCACE),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ImageScreen()
                                  )
                              );
                            }
                        )
                    )
                ] else ...[
                  Text("${drugState}",
                    style: TextStyle (
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                    ),
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
                                  title: Text('404'),
                                  subtitle: Text("No Data Found"),//detail.<>),
                                ),
                              ]
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                ],
            ]
          ),
        ),
      ),
      floatingActionButton: drugState == "Real"?
        FloatingActionButton.extended(
          label: Text('Check Drug'),
          icon: const Icon(Icons.add_a_photo),
          backgroundColor: Color(0xFF6FCACE),
          hoverColor: Colors.green[800],
          onPressed: (){
            _getFromCamera();
          },
        ):
        FloatingActionButton.extended(
          label: Text('Report Drug'),
          icon: const Icon(Icons.report),
          backgroundColor: Color(0xFF6FCACE),
          hoverColor: Colors.green[800],
          onPressed: (){
            showDialog(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                Future.delayed(Duration(seconds: 2), () {
                          Navigator.of(context).pop(true);
                        });
                return AlertDialog(
                  title: const Text('Title'),
                  content: Text("Your report has been lodged."),
                );
              },
            );
          },
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
                    subtitle: Text("Singapore >  China > Singapore"),//detail.<>),
                  ),
                    ListTile(
                      title: Text('Name'),
                      subtitle: Text("KLORPO TABLETS 5 mg"),//detail.<>),
                    ),
        ListTile(
          title: Text('Batch Number'),
          subtitle: Text("A18"),//detail.<>),
        ),
        ListTile(
          title: Text('Expiry Date'),
          subtitle: Text("Aug 8, 2025"),//detail.<>),
        ),
        ListTile(
          title: Text('Ingredients'),
          subtitle: Text("CHLORDIAZEPOXIDE HCl EQV CHLORDIAZEPOXIDE"),//detail.<>),
        ),

                ],
              ),
            ),
          ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    final String path = "./open_meds/assets.jpeg";
    log(path);
    XFile? pickedFile = (await _picker.pickImage(
      source: ImageSource.camera,
    ));
    if (pickedFile != null) {
      setState(() {
        log("in loop");
        final File file = File(pickedFile.path);
        imageFile = file.copy('$path/image1.png') as File;
      });
    }
  }
}