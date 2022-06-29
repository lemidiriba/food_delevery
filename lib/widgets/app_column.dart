import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
   String text;
   double size;
   AppColumn({Key? key,required this.text,this.size= 22}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallText(
          text: text,
          fontSize: size,
          color: AppColors.mainBlackColor,
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(
                children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                size: 18,
                color: AppColors.mainColor,
              );
            })),
            SizedBox(
              width: 8,
            ),
            SmallText(
              text: "4.5",
              fontSize: 12,
              color: Colors.black54,
            ),
            SizedBox(
              width: 8,
            ),
            SmallText(
              text: "1287 Comments",
              fontSize: 12,
              color: Colors.black54,
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
                icon: Icons.circle,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconAndText(
                icon: Icons.location_on,
                text: "1.7 km",
                iconColor: AppColors.mainColor),
            IconAndText(
                icon: Icons.access_time_rounded,
                text: "Normal",
                iconColor: AppColors.iconColor2)
          ],
        )
      ],
    );
  }
}
