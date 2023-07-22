import 'package:driver/controller/locationController.dart';
import 'package:get/get.dart';

import '../model/ordertripHelper.dart';
import '../model/Cars.dart';

class DriversListController extends GetxController {
  locationController  controller = new locationController();
  OrderTripHelper controller1 =new OrderTripHelper();
  List<Cars> carss = [];

  void setList() async {
    carss = await controller1.getnearbyCars('Damascus');
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    setList();
  }
}
