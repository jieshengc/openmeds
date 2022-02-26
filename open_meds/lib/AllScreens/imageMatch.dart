import 'dart:io';
import 'package:image/image.dart';
import 'package:image_compare/image_compare.dart';
import 'dart:developer';

void imageMatch() async {
  final file1 = File('assets/Picture1.png');
  final file2 = File('assets/Picture2.png');

  // Calculate euclidean color distance between two images
  var imageResult = await compareImages(
      src1: file1, src2: file2, algorithm: EuclideanColorDistance(ignoreAlpha: true));

  log('Difference: ${imageResult * 100}%');
}