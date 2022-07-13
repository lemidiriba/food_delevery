import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';

class SmallText extends StatelessWidget {
  String text;
  Color? color;
  double? fontSize;

  SmallText(
      {Key? key,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.fontSize = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        wordSpacing: 1.5
      ),
    );
  }
}
