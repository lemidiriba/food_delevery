import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  String text;
  ExpandableTextWidget({Key? key, required this.text}) : super(key: key);
  @override
  State<ExpandableTextWidget> createState() => ExpandableTextWidgetState();
}

class ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool isHidden = true;

  double textHeight = Dimension.screenHeight / 5.0;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text.substring(0, widget.text.length);
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? SmallText(text: firstHalf): Container(
        child: Column(
          children: [
            SmallText(text: isHidden? (firstHalf + "...") : (firstHalf + secondHalf)),
            InkWell(
              onTap: (() {
                setState(() {
                  isHidden = !isHidden;
                });
              }),
              child: Row(
                children: [
                  SmallText(text: "show more",color: AppColors.mainColor,),
                  Icon(isHidden ? Icons.arrow_drop_down: Icons.arrow_drop_up, color: Color(0xFF89dad0)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
