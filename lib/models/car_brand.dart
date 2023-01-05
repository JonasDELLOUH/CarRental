import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';
import 'package:flutter/material.dart';

class CarBrand {
  String carBrandId;
  String carBrandName;
  String carBrandImageUrl;

  CarBrand(
      {required this.carBrandId,
      required this.carBrandImageUrl,
      required this.carBrandName});

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.id: carBrandId,
      FirestoreConstants.carBrandName: carBrandName,
      FirestoreConstants.imageUrl: carBrandImageUrl
    };
  }

  factory CarBrand.basicFromMap(Map<String, dynamic> map) {
    return CarBrand(
        carBrandId: map[FirestoreConstants.id],
        carBrandImageUrl: map[FirestoreConstants.imageUrl],
        carBrandName: map[FirestoreConstants.carBrandName]);
  }

  static CarBrand fromMap(AsyncSnapshot<DocumentSnapshot> snapshot) {
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

    return CarBrand.basicFromMap(data);
  }

  static List<CarBrand> toList(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<CarBrand> carBrandList = [];
    for (var documentSnapshot in snapshot.data!.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      CarBrand carBrand = CarBrand.basicFromMap(data);
      carBrandList.add(carBrand);
    }
    return carBrandList;
  }
}
