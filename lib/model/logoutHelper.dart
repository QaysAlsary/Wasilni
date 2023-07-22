import 'package:driver/view/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'registerHelper.dart';

// if there isa problem with the variable token try to put it here  to be global
RegisterHelper registerhelper = Get.put(RegisterHelper());
// Variables variables =  Variables();

class LogoutHelper {
  String serverUrl = 'http://192.168.198.130:8000/api/user';
  var status;

  // var token;
  Future? logout() async {
    String loginUrl = '$serverUrl/logout';
    Uri url = Uri.parse('$loginUrl');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${registerhelper.token}',
      },
    ).then((value) {
      print(value.toString());
      print(value.statusCode);
      // var data = json.decode(value.body);

      if (value.statusCode == 200) {
        status = false;
        print('Status code11111111111111111111: ${value.statusCode}');
        print('logout1111111111111111111');
        Get.offAll(welcomScreen());
      } else {
        Get.back();
        Get.snackbar(
          'error',
          'fault in loging out',
          colorText: Colors.black,
          duration: Duration(seconds: 10),
        );
        print("fault in logout${registerhelper.token}");
      }
    });
  }
}
