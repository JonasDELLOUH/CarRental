import 'package:car_rental/constants/firestore_constants.dart';
import 'package:car_rental/services/car_brand_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'car_brand.dart';

class Car {
  String carId;
  CarBrand carBrand;
  int nbrStars;
  int nbrPlaces;
  double rentalPrice;
  double carSpeed;
  String carImageUrl;
  String carModel;
  int addedDate;
  bool isReserved;
  bool isRented;
  String overview;

  Car(
      {required this.carId,
      required this.carBrand,
      required this.nbrPlaces,
      required this.nbrStars,
      required this.rentalPrice,
      required this.carSpeed,
      required this.carImageUrl,
      required this.carModel,
      required this.addedDate,
      required this.isReserved,
      required this.isRented,
      required this.overview});

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.id: carId,
      FirestoreConstants.carBrand: carBrand.carBrandId,
      FirestoreConstants.nbrStars: nbrStars,
      FirestoreConstants.nbrPlaces: nbrPlaces,
      FirestoreConstants.rentalPrice: rentalPrice,
      FirestoreConstants.carSpeed: carSpeed,
      FirestoreConstants.imageUrl: carImageUrl,
      FirestoreConstants.carModel: carModel,
      FirestoreConstants.addedDate: addedDate,
      FirestoreConstants.isReserved: isReserved,
      FirestoreConstants.isRented: isRented,
      FirestoreConstants.overview: overview
    };
  }

  factory Car.basicFromMap(Map<String, dynamic> map) {
    return Car(
        carId: map[FirestoreConstants.id],
        carBrand: CarBrand.basicFromMap(map[FirestoreConstants.carBrand]),
        nbrPlaces: map[FirestoreConstants.nbrPlaces],
        nbrStars: map[FirestoreConstants.nbrStars],
        rentalPrice: map[FirestoreConstants.rentalPrice],
        carSpeed: map[FirestoreConstants.carSpeed],
        carImageUrl: map[FirestoreConstants.imageUrl],
        carModel: map[FirestoreConstants.carModel],
        addedDate: map[FirestoreConstants.addedDate],
        isReserved: map[FirestoreConstants.isReserved],
        isRented: map[FirestoreConstants.isRented],
        overview: map[FirestoreConstants.overview]);
  }

  static Future<Car> fromMap(AsyncSnapshot<DocumentSnapshot> snapshot) async {
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

    CarBrandService carBrandService = CarBrandService();
    Map<String, dynamic>? map = {};

    map = await carBrandService.getDataToMap(
        document: data[FirestoreConstants.carBrand]);
    print("Voici enfin : ${map!["id"]}");

    data[FirestoreConstants.carBrand] = map;

    return Car.basicFromMap(data);
  }

  static Future<List<Car>> toList(AsyncSnapshot<QuerySnapshot> snapshot) async {
    List<Car> carList = [];
    for (var documentSnapshot in snapshot.data!.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;

      CarBrandService carBrandService = CarBrandService();
      Map<String, dynamic>? map = {};
      map = await carBrandService.getDataToMap(
          document: data[FirestoreConstants.carBrand]);
      data[FirestoreConstants.carBrand] = map;

      Car car = Car.basicFromMap(data);
      carList.add(car);
    }
    return carList;
  }
}
