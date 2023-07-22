import 'package:flutter/material.dart';

import '../model/Cars.dart';

class CarCard extends StatelessWidget {
  final Cars cars;
  final Function press;

  const CarCard({
    Key? key,
    required this.cars,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        padding: EdgeInsets.all(5),
        height: 75,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: Color(0xFFFDC80D),
        ),
        child: Row(
          children: [
            Image.asset('images/taxi.png'),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              children: [
                Text(
                  '${cars.name}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Car size: ${cars.cartype}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
