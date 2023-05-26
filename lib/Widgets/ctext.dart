import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;

  const CustomText(
      {super.key,
      this.color,
      this.fontWeight,
      this.size,
      required this.text,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        style: TextStyle(
            fontSize: size,
            fontWeight: fontWeight,
            color: color,
            overflow: overflow),
      ),
    );
  }
}
