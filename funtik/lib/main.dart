import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:funtik/constants.dart';
import 'package:funtik/views/widgets/screens/home_screen.dart';
import 'package:funtik/views/widgets/screens/login_screen.dart';
import 'package:funtik/views/widgets/screens/signup_screen.dart';
import 'package:funtik/views/widgets/screens/video_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'controllers/auth_controller.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return GetMaterialApp(
       debugShowCheckedModeBanner:  false,
     

      title: 'funtik',
       theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
       ),
      home:LoginScreen(),
    );
  }
}

