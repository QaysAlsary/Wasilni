import 'dart:convert';

import 'package:driver/view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// Variables variables =  Variables();
class RegisterHelper {
  String serverUrl = 'http://192.168.198.130:8000/api/user';
  var status;
  var token;

  Future? registerData(
    String userName,
    String email,
    String password,
    String number,
      String? devicetoken,
  ) async {
    String registerUrl = '$serverUrl/user/register';
    Uri url = Uri.parse('$registerUrl');
    final response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'name': '$userName',
        'email': '$email',
        'password': '$password',
        'number': '$number',
        'fcm_token': '$devicetoken',
      },
    ).then((value) {
      print(value.toString());
      print(value.statusCode);
      var data = json.decode(value.body);

      if (value.statusCode == 201|| value.statusCode==200) {
        status = false;

        token = data['acces_token'];
        Get.offAll(homeScreen());
      }else{
        Get.back();
        Get.snackbar(
          'error',
          'check your email or password',
          colorText: Colors.black,
        );
        print("ppppppppppppppppp0${token}");
      }
    });
  }
}
