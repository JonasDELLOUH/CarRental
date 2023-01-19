import 'package:car_rental/services/base.dart';
import 'package:car_rental/services/car_brand_services.dart';
import 'package:car_rental/services/car_services.dart';
import 'package:car_rental/services/customer_services.dart';
import 'package:car_rental/services/member_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';
import '../models/reservation.dart';
import 'package:flutter/material.dart';

class ReservationServices extends BaseServices {
  ReservationServices() {
    super.collectionName = FirestoreConstants.reservation;
  }

  static final firestoreInstance = FirebaseFirestore.instance;

  Future<List<Reservation>> getReservations(
      {required String customerId}) async {
    List<Reservation> reservationList = [];
    QuerySnapshot querySnapshot;
    if (customerId.isNotEmpty) {
      querySnapshot = await firestoreInstance
          .collection(collectionName)
          .where(FirestoreConstants.customer, isEqualTo: customerId)
          .get();
    } else {
      querySnapshot = await firestoreInstance.collection(collectionName).get();
    }

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;

      CarServices carServices = CarServices();
      CarBrandService carBrandService = CarBrandService();
      CustomerServices customerServices = CustomerServices();
      MemberServices memberServices = MemberServices();
      Map<String, dynamic>? map1 = {};
      Map<String, dynamic>? map2 = {};
      Map<String, dynamic>? map3 = {};
      Map<String, dynamic>? map4 = {};
      map1 = await carServices.getDataToMap(
          document: data[FirestoreConstants.car]);

      map2 = await customerServices.getDataToMap(
          document: data[FirestoreConstants.customer]);

      map3 = await memberServices.getDataToMap(
          document: map2![FirestoreConstants.member]);

      map4 = await carBrandService.getDataToMap(
          document: map1![FirestoreConstants.carBrand]);

      map1[FirestoreConstants.carBrand] = map4;
      map2[FirestoreConstants.member] = map3;
      data[FirestoreConstants.car] = map1;
      data[FirestoreConstants.customer] = map2;
      Reservation reservation = Reservation.basicFromMap(data);
      reservationList.add(reservation);
    }

    return reservationList;
  }

  Stream<List<Reservation>> getReservationsStream(
          {required String customerId}) =>
      Stream.periodic(const Duration(seconds: 5))
          .asyncMap((_) => getReservations(customerId: customerId));
}
