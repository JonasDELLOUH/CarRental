import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';

import 'base.dart';
import 'car_services.dart';
import 'customer_services.dart';

class LocationServices extends BaseServices {
  LocationServices() {
    super.collectionName = FirestoreConstants.location;
  }

  static final firestoreInstance = FirebaseFirestore.instance;

  @override
  Future<List> getCollectionToMap(
      {String fieldName = "", dynamic value}) async {
    CarServices carServices = CarServices();
    CustomerServices customerServices = CustomerServices();
    List l = await super.getCollectionToMap(fieldName: fieldName, value: value);
    for (dynamic reservation in l) {
      Map<String, dynamic>? map1 = await carServices.getDocumentToMap(
          document: reservation[FirestoreConstants.car]);
      reservation[FirestoreConstants.car] = map1;
      Map<String, dynamic>? map2 = await customerServices.getDocumentToMap(
          document: reservation[FirestoreConstants.customer]);
      reservation[FirestoreConstants.customer] = map2;
    }
    return l;
  }

  @override
  Future<Map<String, dynamic>?> getDocumentToMap(
      {String document = "",
      String whereValue = "",
      String whereField = ""}) async {
    Map<String, dynamic>? map = await super.getDocumentToMap(
        document: document, whereValue: whereValue, whereField: whereField);
    if (map != null || map!.isNotEmpty) {
      CustomerServices customerServices = CustomerServices();
      Map<String, dynamic>? map1 = await customerServices.getDocumentToMap(
          document: map[FirestoreConstants.customer]);
      map![FirestoreConstants.customer] = map1;
    }
    return map;
  }
}
