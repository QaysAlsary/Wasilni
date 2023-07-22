import 'dart:async';
import 'dart:ui';

import 'package:driver/controller/driversListController.dart';
import 'package:driver/controller/locationController.dart';
import 'package:driver/model/logoutHelper.dart';
import 'package:driver/model/ordertripHelper.dart';
import 'package:driver/view/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/Cars.dart';
import 'CarCard.dart';

class homeScreen extends StatelessWidget {
  final locationController controller1 = Get.put(locationController());
  final LogoutHelper logoutHelper = Get.put(LogoutHelper());
  OrderTripHelper controller3 = new OrderTripHelper();

  Completer<GoogleMapController> _controller = Completer();
  // List<Cars> cars = [];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final CameraPosition _kLake = const CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(32.9573689, 35.9586301),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  moveCamera() async {
    controller1.getLocation();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(controller1.latitude, controller1.longitude),
            zoom: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      //Map
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Stack(children: [
            GetBuilder<locationController>(
              init: locationController(),
              builder: (controller) => Container(
                width: width,
                height: height,
                child: GoogleMap(
                  mapType: MapType.normal,
                  onCameraMoveStarted: () {
                    CameraUpdate.newCameraPosition(CameraPosition(
                      target: LatLng(controller.latitude, controller.longitude),
                      zoom: 14.4746,
                    ));
                  },
                  myLocationEnabled: true,
                  onCameraMove: (CameraPosition) {
                    CameraUpdate.newCameraPosition(CameraPosition);
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(controller.latitude, controller.longitude),
                    zoom: 14.4746,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFDC80D),
                      borderRadius: BorderRadius.circular(
                        100.0,
                      ),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Drawer();
                          // Get.to(settingsScreen());
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                    child: CircularProgressIndicator());
                              });
                          logoutHelper.logout();
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: height * 0.70,
                  ),
                  GetBuilder<locationController>(
                    init: locationController(),
                    builder: (controller) => Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xFFFDC80D),
                      ),
                      height: 50,
                      child: MaterialButton(
                        onPressed: () async {
                          print('${await controller.address}');
                          print( await controller.address1);
                          // print('${await registerhelper.token}');
                          await controller.getLatLongFromAddress('Jediyyeh');
                          print('${await controller.Lat}');
                          print('${await controller.Long}');
                        },
                        child: Row(
                          children: [
                            Icon(Icons.my_location_rounded),
                            Padding(
                                padding: EdgeInsets.only(
                                  right: 10,
                                ),
                                child: Text(
                                  'Your location is  ${controller.address}',
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Container(
                  //  padding: EdgeInsets.all(5),
                  //   height: 75,
                  //   width: 200,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(7.0),
                  //     color: Color(0xFF5F95DB),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Image(image: AssetImage('images/taxi.png'),
                  //       ),
                  //       SizedBox(width: 20,),
                  //       Expanded(child: Text('The driver name or data')),
                  //     ],
                  //   ),
                  // ),
                  GetBuilder<DriversListController>(
                    init: DriversListController(),
                    builder: (controller2) => Container(
                      height: 75,
                      child: ListView.separated(
                        itemBuilder: (context, index) => CarCard(
                          cars:  controller2.carss[index],
                          press: () async {
                            Cars? c;
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                });
                            controller3.getProfile(controller2.carss[index].id!)?.then((value) {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => profileScreen(cars: value,)));
                            });

                          },
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller2.carss.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Center(
                  //   child: Container(
                  //
                  //
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(7.0),
                  //       color: Color(0xFF5F95DB),
                  //     ),
                  //     height: 50,
                  //     width: double.infinity,
                  //     child: MaterialButton(
                  //       onPressed: (){
                  //        Get.to(orderScreen());
                  //       },
                  //       child: Text('Order now'),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
