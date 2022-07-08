import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.data,
      this.fontColor,
      this.fontWeight,
      this.fontSize})
      : super(key: key);
  final String data;
  double? fontSize;
  FontWeight? fontWeight;
  Color? fontColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 20,
          color: fontColor ?? Colors.black),
    );
  }
}
