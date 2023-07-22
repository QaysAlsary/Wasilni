import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'Cars.dart';
import '../view/completOrderScreen.dart';
import '../view/homeScreen.dart';
import 'registerHelper.dart';

RegisterHelper registerhelper = Get.put(RegisterHelper());

class OrderTripHelper {
  static String serverUrl = 'http://192.168.198.130:8000/api';
  static var status;
  static var tripid, distance, price, time;

  static Future? ordertrip(
    String startlocation,
    String endlocation,
    double startLat,
    double startLong,
    double endtLat,
    double endtLong,
    String note,
    int id,
  ) async {
    String ordertripUrl = '$serverUrl/ordertrip';
    http.post(
      Uri.parse('$ordertripUrl'),
      headers: {
        'Authorization': 'Bearer ${registerhelper.token}',
      },
      body: {
        'first_location': '$startlocation',
        'end_location': '$endlocation',
        'lat1': '$startLat',
        'long1': '$startLong',
        'lat2': '$endtLat',
        'long2': '$endtLong',
        'note': '$note',
        'driver_id': '$id',
      },
    ).then((value) {
      print(value.toString());
      print(value.statusCode);
      print('Response body: ${value.body}');
      var data = json.decode(value.body);

      if (value.statusCode == 200) {
        status = false;
        tripid = data['trip_id'];
        distance = data['distance'];
        price = data['price'];
        time = data['time'];
        Get.offAll(completOrderScreen());
        print('Status code11111111111111111111: ${value.statusCode}');
        print('ordering a trip1111111111111111111');
        print('$tripid 55555555555555555555555555555');
        print('$distance 66666666666666666666666');
        print('$price 77777777777777777777777777');
        // Get.offAll(completOrderScreen());
      } else {
        Get.back();
        Get.snackbar(
          'error',
          'Problem in order trip ',
          colorText: Colors.black,
          duration: Duration(seconds: 10),
        );
        print(
            "fault in order trip11111111111111111111${value.statusCode}111111111111111111111111111111111 ${registerhelper.token}");
      }
    });
  }

  static Future? cancelTrip(tripid) async {
    String cancelUrl = '$serverUrl/delete/$tripid';
    Uri url = Uri.parse('$cancelUrl');
    final response = await http.delete(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${registerhelper.token}',
      },
    ).then((value) {
      print(value.toString());
      print(value.statusCode);
      // var data = json.decode(value.body);

      if (value.statusCode == 201) {
        status = false;
        print('Status code11111111111111111111: ${value.statusCode}');
        print('canceledt1111111111111111111');
        Get.offAll(homeScreen());
      } else {
        Get.back();
        Get.snackbar(
          'error',
          'Problem in canceling your trip',
          colorText: Colors.black,
          duration: Duration(seconds: 10),
        );
        print("fault in canceling trip${registerhelper.token}");
      }
    });
  }

  static Future? editTrip(
    String endlocation,
    double endtLat,
    double endtLong,
  ) async {
    String editTripUrl = '$serverUrl/updatetrip';
    http.post(
      Uri.parse('$editTripUrl'),
      headers: {
        'Authorization': 'Bearer ${registerhelper.token}',
      },
      body: {
        'end_location': '$endlocation',
        'lat2': '$endtLat',
        'long2': '$endtLong',
      },
    ).then((value) {
      print(value.toString());
      print(value.statusCode);
      print('Response body: ${value.body}');
      var data = json.decode(value.body);

      if (value.statusCode == 200) {
        status = false;
        tripid = data['trip_id'];
        distance = data['distance'];
        price = data['price'];
        time = data['time'];
        Get.offAll(completOrderScreen());
        print('Status code11111111111111111111: ${value.statusCode}');
        print('edit the trip1111111111111111111');
        print('$tripid 55555555555555555555555555555');
        print('$distance 66666666666666666666666');
        print('$price 77777777777777777777777777');
        print('$time 888888888888888888888888888');
        // Get.offAll(completOrderScreen());
      } else {
        Get.back();
        Get.snackbar(
          'error',
          'Problem in editing your trip',
          colorText: Colors.black,
          duration: Duration(seconds: 10),
        );
        print(
            "fault in order trip11111111111111111111${value.statusCode}111111111111111111111111111111111 ${registerhelper.token}");
      }
    });
  }

  static Future? confirmTrip() async {
    String confirmUrl = '$serverUrl/confirmtrip';
    Uri url = Uri.parse('$confirmUrl');
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
        print('Status code1111111111111111111111111111111111111111: ${value.statusCode}');
        print('confirmed1111111111111111111');
        Get.offAll(homeScreen());
      } else {
        Get.back();
        Get.snackbar(
          'error',
          'Problem in confirming your trip',
          colorText: Colors.black,
          duration: Duration(seconds: 10),
        );
        print("fault in confirming${registerhelper.token}");
      }
    });
  }



  Future? getnearbyCars(
    String startlocation,
  ) async {
    String getnearbyCarsUrl = '$serverUrl/getnearby/$startlocation';
    return await http.get(
      Uri.parse('$getnearbyCarsUrl'),
      headers: {
        'Accept':'application/json',
        'Authorization': 'Bearer ${registerhelper.token}',
      },
    ).then((value) {
      print(value.toString());
      print(value.statusCode);
      List<Cars> myCars =[];
      if (value.statusCode == 200) {
        status = false;
        final data = json.decode(value.body);
        for (var carsInfo in data) {
          myCars.add(Cars.fromJson(carsInfo));
        }
        print('${value.body}');
        print('$myCars');
        return myCars;
      } else {
        Get.snackbar(
          'error',
          'Problem in finding cars nearby',
          colorText: Colors.black,
          duration: Duration(seconds: 10),
        );
        print(
            "fault in get nearby cars ${value.statusCode}${registerhelper.token}");
      }
    });
  }
  Future<Cars>? getProfile(int id)async{
    String getProfileUrl = '$serverUrl/getprofile/$id' ;
    Uri url = Uri.parse(getProfileUrl);
    return await http.get(url,headers: {
      'Accept':'application/json',
      "Authorization":"Bearer ${registerhelper.token}"
    },).then((value){
      print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww $value");
      var map = jsonDecode(value.body);
      print(value.body);
      Cars car = Cars.fromJson(map['driver']);
      // car.price = map['discount_price']*1.0;
      return car;
    });
  }
  Future? rate(
      int id,
      var rate,
      ) async {
    String rateUrl = '$serverUrl/drivers/$id/comments/store';
    Uri url = Uri.parse('$rateUrl');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${registerhelper.token}',
      },
      body: {
        'rate': '$rate',
      },
    ).then((value) {
      print(value.toString());
      print(value.statusCode);
      // var data = json.decode(value.body);

      if (value.statusCode == 200) {
        status = false;
        print('Status code11111111111111111111: ${value.statusCode}');
        print('rated1111111111111111111');
      } else {
        Get.snackbar(
          'error',
          'Problem in finding cars nearby',
          colorText: Colors.black,
          duration: Duration(seconds: 10),
        );
        print("fault in logout${registerhelper.token}");
      }
    });
  }
}
