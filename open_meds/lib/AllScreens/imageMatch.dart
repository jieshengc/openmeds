import 'package:image/image.dart';
import 'package:image_compare/image_compare.dart';
import 'dart:developer';

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

void imageMatch() async {
  File file1 = await getImageFileFromAssets('Picture3.png');
  File file2 = await getImageFileFromAssets('Picture2.png');

  // Calculate euclidean color distance between two images
  var imageResult = await compareImages(
      src1: file1, src2: file2, algorithm: IMED());

  log('Difference: ${imageResult * 100}%');
}