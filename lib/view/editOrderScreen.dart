import 'package:driver/controller/editOrderController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditOrderScreen extends StatelessWidget {
  const EditOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<EditOrderController>(
          init: EditOrderController(),
          builder: (controller) => Form(
              key: controller.editorderForm,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        child: TextFormField(
                          cursorColor: Color(0xFFFDC80D),
                          controller: controller.editeddropoffController,
                          onSaved: (value) {
                            controller.editeddroppff = value!;
                          },
                          validator: (value) {
                            return controller.validateDropOff(value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'New drop off location',
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
                      Container(
                        height: height * 0.83,

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
                                              child:
                                                  CircularProgressIndicator());
                                        });
                                    controller.checkOrder();
                                    // print('222222222222222222222222222222222222222222222222${controller.noteController}');
                                  },
                                  child: Text('Confirm your Edit'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
