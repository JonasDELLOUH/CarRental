import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';
import '../models/reservation.dart';
import 'package:flutter/material.dart';

import 'base.dart';
import 'car_brand_services.dart';
import 'car_services.dart';
import 'customer_services.dart';
import 'member_services.dart';

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
      map1 = await carServices.getDocumentToMap(
          document: data[FirestoreConstants.car]);

      map2 = await customerServices.getDocumentToMap(
          document: data[FirestoreConstants.customer]);

      map3 = await memberServices.getDocumentToMap(
          document: map2![FirestoreConstants.member]);

      map4 = await carBrandService.getDocumentToMap(
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

  @override
  Future<List> getCollectionToMap({String fieldName = "", dynamic value}) async{
    CarServices carServices = CarServices();
    CustomerServices customerServices = CustomerServices();
    List l = await super.getCollectionToMap(fieldName: fieldName, value: value);
    for(dynamic reservation in l){
      Map<String, dynamic>? map1 = await carServices.getDocumentToMap(document: reservation[FirestoreConstants.car]);
      reservation[FirestoreConstants.car] = map1;
      Map<String, dynamic>? map2 = await customerServices.getDocumentToMap(document: reservation[FirestoreConstants.customer]);
      reservation[FirestoreConstants.customer] = map2;
    }
    return l;
  }

  Stream<List<Reservation>> getReservationsStream(
          {required String customerId}) =>
      Stream.periodic(const Duration(seconds: 5))
          .asyncMap((_) => getReservations(customerId: customerId));
}
