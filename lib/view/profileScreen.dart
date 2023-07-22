import 'dart:ui';

import 'package:driver/model/Cars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../model/ordertripHelper.dart';
import 'orderScreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class profileScreen extends StatelessWidget {
final Cars cars;
final OrderTripHelper controller1 = OrderTripHelper();
 profileScreen({Key? key, required this.cars}): super (key:key);


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
              width: width,
              height: height * 0.25,
              color: Color(0xFFFDC80D),
            ),
            Padding(
              padding: EdgeInsets.only(top: 110.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(cars.image!),
                      radius: 60.0,
                    ),
                  ],
                ),
              ]),
            ),
          ]),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              '${cars.name}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          RatingBar.builder(
              initialRating:cars.rating.toDouble(),
              itemBuilder: (context,index)=> Icon(
            Icons.star,
            color: Colors.amber,

          ), onRatingUpdate: (value){
            print(value);
            controller1.rate(cars.id, value);
          }),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: width * 0.50,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.phone,
                  size: 30.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cars.number}',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Phone number',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: width * 0.50,
            height: 50.0,
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  size: 30.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cars.gender}',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: width * 0.50,
            height: 50.0,
            child: Row(
              children: [
                Icon(
                  Icons.car_repair,
                  size: 30.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cars.cartype}',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Vehicle type',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            height: height * 0.30,
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xFFFDC80D),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Get.to(orderScreen(cars: cars,));
                      // OrderTripHelper.getnearbyCars('Al-Mazraa');
                    },
                    child: Text('Order now'),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

// Future<void> GetImage (ImageSource imageSource) async {
//   final pickImage = await imagePicker.pickImage (source:imageSource , imageQuality:100);
//   picketFile = File(pickImage!.path);
//
//   profileController.setProfileImagePath(picketFile!.path);
//
//   Get.back();
// }

// Widget bottomSheet( BuildContext context) {
//   Size size = MediaQuery.of(context).size;
//   return Container(
//     width: double.infinity,
//     height:size.height * 0.2,
//     margin: EdgeInsets.symmetric(
//       vertical: 20.0,
//       horizontal: 10.0,
//     ),
//     child: Column(
//       children: [
//         Text(
//           'Choose Profile Picture',
//           style: TextStyle(
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF5F95DB),
//           ),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InkWell(
//               child:Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.image ,
//                     color:  Color(0xFF5F95DB),
//                   ),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Text(
//                     'Gallery',
//                     style: TextStyle(
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF5F95DB),
//                     ),
//                   ),
//                 ],
//               ),
//               onTap: (){
//                 // GetImage(ImageSource.gallery);
//               },
//             ),
//             SizedBox(
//               width: 70.0,
//             ),
//             InkWell(
//                 child:Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.camera ,
//                       color:  Color(0xFF5F95DB),
//                     ),
//                     SizedBox(
//                       height: 5.0,
//                     ),
//                     Text(
//                       'Camera',
//                       style: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF5F95DB),
//                       ),
//                     ),
//                   ],
//                 ),
//                 onTap:(){
//                   // GetImage(ImageSource.camera);
//                 }
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

}
