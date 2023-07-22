import 'package:driver/view/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/registerHelper.dart';
import '../view/homeScreen.dart';
import '../view/pincodeScreen.dart';

class registerController extends GetxController {
  final RegisterHelper registerHelper = Get.put(RegisterHelper());

  var registerFormKey = GlobalKey<FormState>();
  late TextEditingController userNameController,
      emailController,
      passwordController,
      numberController;
  var userName = '';
  var email = '';
  var password = '';
  var number = '';
  bool isPassword = true;

  @override
  void onInit() {
    super.onInit();

    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    numberController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    numberController.dispose();
  }

  String? validateUserName(String value) {
    if (!GetUtils.isUsername(value)) {
      return 'User name must be not empty';
    }
    return null;
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

  String? validateNumber(String value) {
    if (value.length > 9 || value.length < 9) {
      return 'provide your phone number';
    }
    return null;
  }

  void checkNumber() {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerFormKey.currentState!.save();
    // Get.to(pincodeScreen());
  }

  void checkRegister() {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerFormKey.currentState!.save();
    print(userNameController.text);
    print(emailController.text);
    print(passwordController.text);
    print(numberController.text);
    registerHelper
        .registerData(userNameController.text, emailController.text,
            passwordController.text, numberController.text,devicetoken.toString());

  }

  void changePassword() {
    isPassword = !isPassword;
    update();
  }
}
