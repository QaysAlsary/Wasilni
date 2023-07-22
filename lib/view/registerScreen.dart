import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/registerController.dart';

class registerScreen extends StatelessWidget {
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
              height: height * 0.86,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      25.0,
                    ),
                    topLeft: Radius.circular(
                      25.0,
                    )),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: GetBuilder<registerController>(
                  init: registerController(),
                  builder: (controller) => Form(
                    key: controller.registerFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 300.0,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_left_outlined,
                            size: 40.0,
                            color: Color(0xFFFDC80D),
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
                        'REGISTER',
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
                        'Lets sign up for your account',
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
                          controller: controller.userNameController,
                          onSaved: (value) {
                            controller.userName = value!;
                          },
                          validator: (value) {
                            return controller.validateUserName(value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'User name',
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
                        height: 10.0,
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
                        height: 10.0,
                      ),
                      Container(
                        width: 250.0,
                        height: 50.0,
                        child: GetBuilder<registerController>(
                          init: registerController(),
                          builder: (controller) => TextFormField(
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
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: 250.0,
                        height: 50.0,
                        child: TextFormField(
                          cursorColor: Color(0xFFFDC80D),
                          controller: controller.numberController,
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            controller.number = value!;
                          },
                          validator: (value) {
                            return controller.validateNumber(value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
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
                            prefix: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '+963',
                                style: TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
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
                            controller.checkRegister();
                          },
                          child: Text(
                            'SIGN UP',
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
            ),
          ],
        ),
      ),
    );
  }
}
