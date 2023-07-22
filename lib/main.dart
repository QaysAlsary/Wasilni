import 'package:driver/view/homeScreen.dart';
import 'package:driver/view/loginScreen.dart';
import 'package:driver/view/profileScreen.dart';
import 'package:driver/view/registerScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'view/welcomeScreen.dart';

// SharedPreferences? sharedpref;
// var token;
var devicetoken;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  devicetoken= await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.instance.getToken().then((value) => print(value));
  // sharedpref = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: welcomScreen(),
      initialRoute: "welcomScreen",
      getPages: [
        GetPage(name: "/welcomScreen", page: () => welcomScreen()),
        GetPage(name: "/loginScreen", page: () => loginScreen()),
        GetPage(name: "/registerScreen", page: () => registerScreen()),
        GetPage(name: "/homeScreen", page: () => homeScreen()),

      ],
    );
  }
}
