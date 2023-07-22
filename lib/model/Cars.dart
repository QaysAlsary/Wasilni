class Cars {
  final String? image, name, address, gender, cartype;
  var id,number,rating;

  Cars({
    required this.image,
    required this.name,
    required this.address,
    required this.gender,
    required this.cartype,
    required this.number,
    required this.id,
    required this.rating,
  });

  factory Cars.fromJson(Map<dynamic, dynamic> json) => Cars(
         id: json['id'],
         name: json['name'],
         gender: json['gender'],
         cartype: json['typeofcar'],
         image: json['image'],
         number: json['number'],
         address: json['address'],
         rating: json['rating'],
      );

  Map<dynamic, dynamic> toJson() => {
        'name': name,
        'gender': gender,
        'typeofcar': cartype,
        'image': image,
        'number': number,
        'address': address,
        'rating': rating
      };
}

List<Cars> cars = [
  Cars(
    image: "images/car.png",
    name: "qays",
    address: "Al-Mazraa",
    gender: "male",
    cartype: "small",
    number: "0987456321",
    id: 1,
    rating: 3,
  ),
  Cars(
    image: "images/taxi.png",
    name: "hadi",
    address: "Al-Mazraa",
    gender: "male",
    cartype: "small",
    number: "0987456321",
    id: 2,
    rating: 3,
  ),
  Cars(
    image: "images/car.png",
    name: "smr",
    address: "Al-Mazraa",
    gender: "female",
    cartype: "large",
    number: "0987456321",
    id: 3,
    rating: 3,
  ),
  Cars(
    image: "images/taxi.png",
    name: "habeb",
    address: "Al-Mazraa",
    gender: "male",
    cartype: "large",
    number: "0987456321",
    id: 4,
    rating: 3,
  ),
];

// To parse this JSON data, do
//
//     final cars = carsFromJson(jsonString);

// import 'dart:convert';
//
// Cars carsFromJson(String str) => Cars.fromJson(json.decode(str));
//
// String carsToJson(Cars data) => json.encode(data.toJson());
//
// class Cars {
//   Cars({
//     required this.messege,
//     required this.drivers,
//   });
//
//   String messege;
//   Map<String, Driver> drivers;
//
//   factory Cars.fromJson(Map<String, dynamic> json) => Cars(
//     messege: json["messege"],
//     drivers: Map.from(json["drivers"]).map((k, v) => MapEntry<String, Driver>(k, Driver.fromJson(v))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "messege": messege,
//     "drivers": Map.from(drivers).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//   };
// }
//
// class Driver {
//   Driver({
//     required this.id,
//     required this.name,
//     required  this.gender,
//     required this.typeofcar,
//     required this.image,
//     required this.number,
//     required this.address,
//   });
//
//   int id;
//   String name;
//   String gender;
//   String typeofcar;
//   String image;
//   int number;
//   String address;
//
//   factory Driver.fromJson(Map<String, dynamic> json) => Driver(
//     id: json["id"],
//     name: json["name"],
//     gender: json["gender"],
//     typeofcar: json["typeofcar"],
//     image: json["image"],
//     number: json["number"],
//     address: json["address"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "gender": gender,
//     "typeofcar": typeofcar,
//     "image": image,
//     "number": number,
//     "address": address,
//   };
// }
