import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'registerHelper.dart';

// if there isa problem with the variable token try to put it here  to be global
RegisterHelper registerhelper = Get.put(RegisterHelper());

// Variables variables =  Variables();

class LoginHelper {
  String serverUrl = 'http://192.168.198.130:8000/api/user';
  var status;

  // var token;

  Future? login(
    String email,
    String password,
      String? devicetoken,
  ) async {
    //progress indicator

    String registerUrl = '$serverUrl/login';
    Uri url = Uri.parse('$registerUrl');
    final response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'email': '$email',
        'password': '$password',
        'fcm_token': '$devicetoken',
      },
    ).then((value) {
      print(value.toString());
      print(value.statusCode);
      var data = json.decode(value.body);

      if (value.statusCode == 200) {
        status = false;

        registerhelper.token = data['access_token'];
        print('=======================${devicetoken}==========================');
      }else{
      Get.back();
      Get.snackbar(
        'error',
        'check your email or password',
        colorText: Colors.black,
        duration: Duration(seconds: 10),
      );
      print("ppppppppppppppppp0${registerhelper.token}");}
    });
  }
}
