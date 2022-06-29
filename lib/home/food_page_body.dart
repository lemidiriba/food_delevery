import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_column.dart';
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
  final _scaleFactor = 0.8;
  final _height = 220;

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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          height: Dimension.pageViewContainer,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 5,
            itemBuilder: (contect, postion) {
              return _buldPageItem(postion);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18, 9),
              activeColor: AppColors.mainColor,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              LargText(
                text: "Popular",
                color: Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              LargText(
                text: ".",
                color: Colors.black26,
              ),
              const SizedBox(
                width: 10,
              ),
              SmallText(
                text: "food pairing",
                color: Colors.black54,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 800,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image/food0.png'))),
                    ),
                   
                    Expanded(
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LargText(
                              text: "Nutritious frout Meal",
                              fontSize: 18,
                              color: AppColors.mainBlackColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SmallText(
                              text: "with Chinise characterstics",
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            const SizedBox(
                              height: 15,
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
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buldPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentHeight = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currentHeight, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentHeight = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currentHeight, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentHeight = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currentHeight, 0);
    } else {
      final currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            width: double.maxFinite,
            height: Dimension.pageViewImageContainer,
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
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              width: double.maxFinite,
              height: Dimension.pageViewTextContainer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: AppColumn(text: "Chinese Side",size: 22,)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
