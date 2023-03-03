import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';
import '../models/customer.dart';
import '../models/member.dart';
import 'base.dart';
import 'member_services.dart';

class CustomerServices extends BaseServices {
  CustomerServices() {
    super.collectionName = FirestoreConstants.customer;
  }

  static final firestoreInstance = FirebaseFirestore.instance;

  MemberServices memberServices = MemberServices();

  @override
  Future<List> getCollectionToMap({String fieldName = "", dynamic value, int limit = 5}) async {
    MemberServices memberServices = MemberServices();
    List l = await super.getCollectionToMap(limit: limit, fieldName: fieldName, value: value);
    for (dynamic customer in l) {
      Map<String, dynamic>? map = await memberServices.getDocumentToMap(
          document: customer[FirestoreConstants.member]);
      customer[FirestoreConstants.member] = map;
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
    if (map != null && map.isNotEmpty) {
      MemberServices memberServices = MemberServices();
      Map<String, dynamic>? map2 = await memberServices.getDocumentToMap(
          document: map[FirestoreConstants.member]);
      map[FirestoreConstants.member] = map2;
    }
    return map;
  }
}
