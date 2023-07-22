import 'package:driver/view/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/loginHelper.dart';
// LoginHelper loginHelper = Get.put(LoginHelper());

class loginController extends GetxController {
  final LoginHelper loginHelper = Get.put(LoginHelper());
  var loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
  bool isPassword = true;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'provide valid Email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return 'Password must be of 8 characters';
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    print(emailController.text);
    print(passwordController.text);
    loginHelper
        .login(emailController.text, passwordController.text,devicetoken.toString())!
        .whenComplete(() {
      if (loginHelper.status) {
        //status true mean there is an error
        print('Failed pleas check your email or password');

      } else {
        // sharedpref!.setString("token", loginHelper.token);
        Get.offAll(homeScreen());
      }
    });
  }

  void changePassword() {
    isPassword = !isPassword;
    update();
  }
}
