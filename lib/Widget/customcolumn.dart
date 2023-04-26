import 'package:flutter/material.dart';
import 'package:tasks2/Widget/customtext.dart';
import 'package:tasks2/Widget/movieimage.dart';

class CustomColumn extends StatelessWidget {
  String imagePath;
  final String? text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;
  final String? text1;
  final double? size1;
  final FontWeight? fontWeight1;
  final Color? color1;
  final TextOverflow? overflow1;
  CustomColumn(
      {super.key,
      required this.imagePath,
      this.color,
      this.fontWeight,
      this.overflow,
      this.size,
      required this.text,
      this.color1,
      this.fontWeight1,
      this.overflow1,
      this.size1,
      required this.text1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieWidget(
          imagePath: imagePath,
        ),
        CustomText(
            text: text,
            color: color,
            size: size,
            fontWeight: fontWeight,
            overflow: overflow),
        CustomText(
            text: text1,
            color: color1,
            size: size1,
            fontWeight: fontWeight1,
            overflow: overflow1)
      ],
    );
  }
}
