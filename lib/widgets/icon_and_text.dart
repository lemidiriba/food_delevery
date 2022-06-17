import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  IconData icon;
  String text;
  Color iconColor;
  IconAndText(
      {Key? key, required this.icon, required this.text, required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(width: 5,),
          SmallText(
            text: text,
            fontSize: 12,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
