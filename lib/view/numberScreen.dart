// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:get/get.dart';
//
// import '../controller/numberController.dart';
// import 'welcomeScreen.dart';
//
// class numberScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: Color(0xFF5F95DB),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           SizedBox(
//             height: 80.0,
//           ),
//           Container(
//             height: height * 0.86,
//             width: width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(
//                     25.0,
//                   ),
//                   topLeft: Radius.circular(
//                     25.0,
//                   )),
//               color: Colors.white,
//             ),
//             child: GetBuilder<numberController>(
//               init: numberController(),
//               builder: (controller) => Form(
//                 key: controller.numberFormKey,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 child: Column(children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                       right: 300.0,
//                     ),
//                     child: IconButton(
//                       color: Color(0xFF5F95DB),
//                       icon: Icon(
//                         Icons.keyboard_arrow_left,
//                         size: 40.0,
//                       ),
//                       onPressed: () {
//                         Get.to(welcomScreen());
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.0,
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 90.0,
//                     child: Image(
//                       image: AssetImage(
//                         'assets/number.png',
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Container(
//                     width: 250.0,
//                     height: 50.0,
//                     child: TextFormField(
//                       cursorColor: Color(0xFF5F95DB),
//                       controller: controller.phoneController,
//                       keyboardType: TextInputType.number,
//                       onSaved: (value) {
//                         controller.number = value!;
//                       },
//                       validator: (value) {
//                         return controller.validateNumber(value!);
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Phone Number',
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                           borderSide: BorderSide(
//                             color: Color(0xFF5F95DB),
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                           borderSide: BorderSide(
//                             color: Color(0xFF5F95DB),
//                           ),
//                         ),
//                         prefix: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             '+963',
//                             style: TextStyle(
//                               fontSize: 17.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 100.0,
//                   ),
//                   Container(
//                     width: 150.0,
//                     height: 50.0,
//                     decoration: BoxDecoration(
//                         color: Color(0xFF5F95DB),
//                         borderRadius: BorderRadius.circular(40.0)),
//                     child: MaterialButton(
//                       onPressed: () {
//                         controller.checkNumber();
//                       },
//                       child: Text(
//                         'Next',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 17.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ]),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
