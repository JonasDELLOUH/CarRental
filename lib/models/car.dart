import 'package:car_rental/constants/firestore_constants.dart';
import 'package:car_rental/providers/firestore_provider.dart';
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


  static Car defaultCar() => Car(
      carId: "mkQ044PKvlQkysHc2fH7",
      carBrand: CarBrand(
          carBrandId: "VOvGIDu0uR68F6BPDliZ",
          carBrandImageUrl:
              "https://firebasestorage.googleapis.com/v0/b/carrental-89ac9.appspot.com/o/carBrand%2FVOvGIDu0uR68F6BPDliZ?alt=media&token=890c6e69-61a5-47e3-8cc1-a66b12bee6f7",
          carBrandName: "Ferrary"),
      nbrPlaces: 5,
      nbrStars: 4,
      rentalPrice: 2500,
      carSpeed: 600,
      carImageUrl:
          "https://firebasestorage.googleapis.com/v0/b/carrental-89ac9.appspot.com/o/car%2FmkQ044PKvlQkysHc2fH7?alt=media&token=0b4e0b03-7183-4fb4-8dec-cf592548e684",
      carModel: "RTRS",
      addedDate: 602,
      isReserved: false,
      isRented: false,
      overview: "Voiture class, très accessible à conduire et super cool.");
}
