import 'package:flutter/material.dart';
import 'package:food_delivery/home/main_food_page.dart';
import 'package:food_delivery/page/detail_food_page.dart';
import 'package:food_delivery/page/recomanded_food_detail_page.dart';
import 'package:food_delivery/helper/dependency.dart' as dep;
import 'package:food_delivery/utils/app_consttants.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: RecomandedFoodDetailPage(),
    );
  }
}
