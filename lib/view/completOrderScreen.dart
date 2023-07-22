import 'package:driver/view/editOrderScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../model/ordertripHelper.dart';
import 'homeScreen.dart';

class completOrderScreen extends StatelessWidget {
  // final completOrderController completordercontroller = Get.put(completOrderController());
  completOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFDC80D),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Container(
              height:  height * 0.85,
              width: width,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(
                  25.0,
                ),),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Center(
                      child: Text(
                        'Trip information',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xFFFDC80D)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          'The distance is:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFFFDC80D)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${OrderTripHelper.distance} Km',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          'Price:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFFFDC80D)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${OrderTripHelper.price} S.p',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          'Time to arrive:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFFFDC80D)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${OrderTripHelper.time} m',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color:Color(0xFFFDC80D),
                            ),
                            height: 50,
                            width: 90,
                            child: MaterialButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(child: CircularProgressIndicator());
                                    });
                                OrderTripHelper.cancelTrip(OrderTripHelper.tripid);
                                // showAlertDialog(context);
                              },
                              child: Text('Cancel'),
                            ),
                          ),
                          // SizedBox(width: 20,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color:Color(0xFFFDC80D),
                            ),
                            height: 50,
                            width: 90,
                            child: MaterialButton(
                              onPressed: () {
                                Get.to(EditOrderScreen());
                              },
                              child: Text('Edit '),
                            ),
                          ),
                          // SizedBox(width: 20,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFFFDC80D),
                            ),
                            height: 50,
                            width: 90,
                            child: MaterialButton(
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(child: CircularProgressIndicator());
                                    });
                                await OrderTripHelper.confirmTrip();
                                Get.offAll(homeScreen());
                              },
                              child: Text('Next'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("cancel"),
    content: Text("The trip has been canceled successfully"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
