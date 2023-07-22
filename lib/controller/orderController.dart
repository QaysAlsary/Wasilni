import 'package:driver/model/Cars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/ordertripHelper.dart';
import 'locationController.dart';

var pickupLat, pickupLong;

class orderController extends GetxController {
  // OrderTripHelper  orderTripHelper = new OrderTripHelper();
  locationController locationcontroller = new locationController();

  var orderFormKey = GlobalKey<FormState>();
  late TextEditingController pickupController,
      dropoffController,
      noteController;
  var pickLat, pickLong, dropLat, dropLong;

  var pickup = '';
  var dropoff = '';
  var notee = '';
  var addr;

  // var password = '';
  // bool isPassword = true;

  // ..text="${locationcontroller.address}"

  @override
  void onInit() {
    super.onInit();

    pickupController = TextEditingController();
    dropoffController = TextEditingController();
    noteController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    pickupController.dispose();
    dropoffController.dispose();
    noteController.dispose();
  }

  String? validatePickUp(String value) {
    if (value.length < 2) {
      return 'Provide a valid location';
    }
    return null;
  }

  String? validateDropOff(String value) {
    if (value.length < 2) {
      return 'Provied a valid location';
    }
    return null;
  }

  void checkOrder(Cars cars) async {
    final isValid = orderFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    orderFormKey.currentState!.save();
    await locationcontroller.getLatLongFromAddress(pickupController.text);
    pickLat = await locationcontroller.Lat;
    pickLong = await locationcontroller.Long;
    await locationcontroller.getLatLongFromAddress(dropoffController.text);
    dropLat = await locationcontroller.Lat;
    dropLong = await locationcontroller.Long;
    pickupLat = pickLat;
    pickupLong = pickLong;
    // after that add those variables to the request  if that went well figure how to get the distance and
    // coast from the response use the login file that waffa sent
    await OrderTripHelper.ordertrip(
        pickupController.text,
        dropoffController.text,
        pickLat,
        pickLong,
        dropLat,
        dropLong,
        noteController.text,
        cars.id);
    //   !.whenComplete(() {
    // if(OrderTripHelper.status){
    //   //status true mean there is an error
    //   Get.snackbar(
    //       'error', 'Problem in your Email',
    //       colorText: Colors.black,);
    // } else{
    //
    //   Get.to(completOrderScreen());
    //
    // }
    // });
  }
}
