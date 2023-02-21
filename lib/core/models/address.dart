import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';
import 'package:flutter/material.dart';

class Address {
  String addressId;
  String description;
  String placeName;
  double latitude;
  double longitude;

  Address(
      {required this.addressId,
      required this.description,
      required this.longitude,
      required this.latitude,
      required this.placeName});

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.addressId: addressId,
      FirestoreConstants.addressDescription: description,
      FirestoreConstants.addressPlaceName: placeName,
      FirestoreConstants.addressLatitude: latitude,
      FirestoreConstants.addressLongitude: longitude
    };
  }

  factory Address.basicFromMap(Map<String, dynamic> map) {
    return Address(
        addressId: map[FirestoreConstants.addressId],
        description: map[FirestoreConstants.addressDescription],
        longitude: map[FirestoreConstants.addressLongitude],
        latitude: map[FirestoreConstants.addressLatitude],
        placeName: map[FirestoreConstants.addressPlaceName]);
  }

  static Address fromMap(AsyncSnapshot<DocumentSnapshot> snapshot) {
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    return Address.basicFromMap(data);
  }

  static List<Address> toList(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<Address> addressList = [];
    for (var documentSnapshot in snapshot.data!.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      Address a = Address.basicFromMap(data);
      addressList.add(a);
    }
    return addressList;
  }
}
