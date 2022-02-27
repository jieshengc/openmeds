import 'dart:developer';
import 'package:image_compare/image_compare.dart';

import 'dart:async';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_meds/DataModel/consumerInput.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

final ImagePicker _picker = ImagePicker();

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}


class _ImageScreenState extends State<ImageScreen> {

  List<Person> persons = [
    Person(name: 'Bill Will', profileImg: 'img/pic-1.png', bio: "Software Developer"),
  ];
  /// Variables
  late File imageFile;
  String drugState = "";
  String serial = "";
  double imageScore = 0.0;
  double imageScoreFake = 0.5;

  @override
  void initState() {
    // TODO: implement initState
    drugState = "Real";
    super.initState();
  }
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
}

imageMatchWrong() async {
  File file1 = await getImageFileFromAssets('Picture1.png');
  File file2 = await getImageFileFromAssets('Picture2.png');

  // Calculate euclidean color distance between two images
  var imageResult = await compareImages(
      src1: file1, src2: file2, algorithm: IMED());

  imageScore = imageResult;
}

imageMatch() async {
  File file1 = await getImageFileFromAssets('Picture3.png');
  File file2 = await getImageFileFromAssets('Picture2.png');

  // Calculate euclidean color distance between two images
  var imageResult = await compareImages(
      src1: file1, src2: file2, algorithm: IMED());

  imageScore = imageResult;
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: [
              Text('Similar Image',textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              Row(children: [
                Image.asset(
                'assets/Picture2.png',
                fit: BoxFit.contain,
                height:180, width:180,
              ),
              Image.asset(
                'assets/Picture3.png',
                fit: BoxFit.contain,
                height: 180, width:180,
              ),
              ],),
              Container(
                    width: 200,
                    height: 50,
                    child: FlatButton(
                        child: Text('Check Image Match',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 18)),
                            shape: RoundedRectangleBorder(side: BorderSide(
                                color: Color(0xFF6FCACE),
                                width: 1,
                                style: BorderStyle.solid
                            ), borderRadius: BorderRadius.circular(5)),
                        color: Color(0xFF6FCACE),
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              Future.delayed(Duration(seconds: 2), () {
                                        Navigator.of(context).pop(true);
                                      });
                              return AlertDialog(
                                title: const Text('Results'),
                                content: Text('Difference in two images: ${imageScore * 100}%'),
                              );
                            },
            )             ;
                        }
                    )
                ),
                SizedBox(height: 30,),
                Text('Different Image',textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              Row(children: [
                Image.asset(
                'assets/Picture1.png',
                fit: BoxFit.contain,
                height:180, width:180,
              ),
              Image.asset(
                'assets/Picture3.png',
                fit: BoxFit.contain,
                height: 180, width:180,
              ),
              ],),
              Container(
                    width: 200,
                    height: 50,
                    child: FlatButton(
                        child: Text('Check Image Match',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 18)),
                            shape: RoundedRectangleBorder(side: BorderSide(
                                color: Color(0xFF6FCACE),
                                width: 1,
                                style: BorderStyle.solid
                            ), borderRadius: BorderRadius.circular(5)),
                        color: Color(0xFF6FCACE),
                        onPressed: () {
                          imageMatchWrong();
                          showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              Future.delayed(Duration(seconds: 2), () {
                                        Navigator.of(context).pop(true);
                                      });
                              return AlertDialog(
                                title: const Text('Results'),
                                content: Text('Difference in two images: ${imageScoreFake * 100}%'),
                              );
                            },
            )             ;
                        }
                    )
                ),
              
            ],
          ),
        )
        )
        );
  }
}