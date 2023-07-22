import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../controller/loginController.dart';

class loginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFDC80D),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
            ),
            Container(
              height: height * 0.85,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      25.0,
                    ),
                    topLeft: Radius.circular(
                      25.0,
                    ),
                  bottomLeft: Radius.circular(
                    25.0,
                  ),
                  bottomRight:  Radius.circular(
                    25.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: GetBuilder<loginController>(
                init: loginController(),
                builder: (controller) => Form(
                  key: controller.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 300.0,
                      ),
                      child: IconButton(
                        color: Color(0xFFFDC80D),
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: 40.0,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFDC80D),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      'Lets login to your account',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withAlpha(40),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: 250.0,
                      height: 50.0,
                      child: TextFormField(
                        cursorColor: Color(0xFFFDC80D),
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          return controller.validateEmail(value!);
                        },
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                              color:Color(0xFFFDC80D) ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Color(0xFFFDC80D),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Color(0xFFFDC80D),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 250.0,
                      height: 50.0,
                      child: TextFormField(
                        cursorColor: Color(0xFFFDC80D),
                        controller: controller.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.isPassword,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          return controller.validatePassword(value!);
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color:Color(0xFFFDC80D) ),

                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color(0xFFFDC80D),
                            ),
                            onPressed: () {
                              controller.changePassword();
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Color(0xFFFDC80D),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Color(0xFFFDC80D),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Color(0xFFFDC80D),
                          borderRadius: BorderRadius.circular(40.0)),
                      child: MaterialButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                    child: CircularProgressIndicator());
                              });
                          controller.checkLogin();
                          ;
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
