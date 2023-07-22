import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/ordertripHelper.dart';
import 'locationController.dart';
import 'orderController.dart';

class EditOrderController extends GetxController {
  locationController locationcontroller = new locationController();
  orderController ordercontroller = new orderController();
  var editorderForm = GlobalKey<FormState>();
  late TextEditingController editeddropoffController;
  var editedpickLat, editedpickLong, editeddropLat, editeddropLong;
  var editeddroppff = '';

  @override
  void onInit() {
    super.onInit();

    editeddropoffController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    editeddropoffController.dispose();
  }

  String? validateDropOff(String value) {
    if (value.length < 2) {
      return 'Provied a valid location';
    }
    return null;
  }

  void checkOrder() async {
    final isValid = editorderForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    editorderForm.currentState!.save();
    // await locationcontroller.getLatLongFromAddress(ordercontroller.pickupController.text);
    // editedpickLat=await locationcontroller.Lat;
    // editedpickLong=await locationcontroller.Long;
    await locationcontroller
        .getLatLongFromAddress(editeddropoffController.text);
    editeddropLat = await locationcontroller.Lat;
    editeddropLong = await locationcontroller.Long;
    await OrderTripHelper.editTrip(
        editeddropoffController.text, editeddropLat, editeddropLong);
  }
}
