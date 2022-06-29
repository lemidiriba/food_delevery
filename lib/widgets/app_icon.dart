import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundColor = const Color(0xfffcf4e4),
      this.size = 40,
      this.iconColor = const Color(0xff756d54)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon,color: iconColor,),
    );
  }
}
