import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class locationController extends GetxController {
  double latitude = 32.9573689;
  double longitude = 35.9586301;
  var address = 'Getting Address..';
  var address1;

  // var locations ='';
  var Lat;
  var Long;
  late StreamSubscription<Position> streamSubscription;

  void listenNotification(){
    FirebaseMessaging.onMessage.listen((event) {
      if(event.notification!=null){
        Get.snackbar(
          '${event.notification!.title}',
          '${event.notification!.body} ',
          colorText: Colors.black,
          duration: Duration(seconds: 10),
        );
      }
    });
  }

  @override
  void onInit() async {
    super.onInit();
    getLocation();
    listenNotification();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamSubscription.cancel();
  }

  getLocation() async {
    bool serviceEnabled;

    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude = position.latitude;
      longitude = position.longitude;
      getAddressFromLatLang(position);
    });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address = '${place.locality},${place.country}';
    address1 = '${place.locality}';
    update();
  }

  Future<void> getLatLongFromAddress(String placename) async {
    List<Location> locations = await locationFromAddress("$placename");
    Location location = locations[0];
    Lat = location.latitude;
    Long = location.longitude;
  }
}

//Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//Position position = await Geolocator.getLastKnownPosition()
