import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/larg_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController _pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      height: 280,
      child: PageView.builder(
          controller: _pageController,
          itemCount: 5,
          itemBuilder: (contect, postion) {
            return _buldPageItem(postion);
          }),
    );
  }

  Widget _buldPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            width: double.maxFinite,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              width: double.maxFinite,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: "Chinese Side",
                      fontSize: 18,
                      color: AppColors.mainBlackColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        ])
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
