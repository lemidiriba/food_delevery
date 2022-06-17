import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';

class LargText extends StatelessWidget {
  String text;
  Color? color;
  double? fontSize;

  LargText(
      {Key? key,
      required this.text,
      this.color = const Color(0xFF89dad0),
      this.fontSize = 25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
