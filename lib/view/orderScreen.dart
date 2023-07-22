import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../model/Cars.dart';
import '../controller/locationController.dart';
import '../controller/orderController.dart';

class orderScreen extends StatelessWidget {
  final Cars cars;
  const orderScreen({Key? key, required this.cars}): super (key:key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<orderController>(
        init: orderController(),
        builder: (controller) => Form(
          key: controller.orderFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),

                  GetBuilder<locationController>(
                    init: locationController(),
                    builder: (controller1) => Container(
                      width: double.infinity,
                      height: 50.0,
                      child: TextFormField(
                        cursorColor: Color(0xFFFDC80D),
                        // initialValue:'${controller1.address} ',
                        controller: controller.pickupController
                          ..text = "${controller1.address1}",
                        onSaved: (value) {
                          controller.pickup = value!;
                        },
                        validator: (value) {
                          return controller.validatePickUp(value!);
                        },
                        decoration: InputDecoration(
                          labelText: 'Pick-up location ${controller1.address}',
                          labelStyle: TextStyle(
                              color:Color(0xFFFDC80D) ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Color(0xFFFDC80D),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Color(0xFFFDC80D),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: TextFormField(
                      cursorColor: Color(0xFFFDC80D),
                      controller: controller.dropoffController,
                      onSaved: (value) {
                        controller.dropoff = value!;
                      },
                      validator: (value) {
                        return controller.validatePickUp(value!);
                      },
                      decoration: InputDecoration(
                        labelText: 'Drop off location',
                        labelStyle: TextStyle(
                            color:Color(0xFFFDC80D) ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFDC80D),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFDC80D),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: TextFormField(
                      cursorColor: Color(0xFFFDC80D),
                      controller: controller.noteController,
                      onSaved: (value) {
                        controller.notee = value!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Notes',
                        labelStyle: TextStyle(
                            color:Color(0xFFFDC80D) ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFDC80D),
                          ),
                        ),

                      ),
                    ),
                  ),
                  // SizedBox(height: 490,),
                  Container(
                    height: height * 0.65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Color(0xFFFDC80D),
                            ),
                            height: 50,
                            width: 350,
                            child: MaterialButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    });
                                controller.checkOrder(cars);
                                // print('222222222222222222222222222222222222222222222222${controller.noteController}');
                              },
                              child: Text('Confirm your order'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
