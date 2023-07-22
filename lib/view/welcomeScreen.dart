import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'loginScreen.dart';
import 'registerScreen.dart';

class welcomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFFFDC80D),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(200.0),
            bottomRight: Radius.circular(200.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/wasilni.png'),
                  radius: 80.0,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'WELCOME',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 90.0,
            ),
            Container(
              width: 150.0,
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0)),
              child: MaterialButton(
                onPressed: () {
                  Get.to(loginScreen());
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Color(0xFFFDC80D),
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 150.0,
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0)),
              child: MaterialButton(
                onPressed: () {
                  Get.to(registerScreen());
                },
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Color(0xFFFDC80D),
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
