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

  Future<bool> isCustomer(Member member) async {
    bool isCustomer = false;

    try {
      DocumentSnapshot documentSnapshot = await firestoreInstance
          .collection(FirestoreConstants.member)
          .doc(member.memberId)
          .get();
      print("aaaaaaaa ${documentSnapshot.exists}");
      isCustomer = documentSnapshot.exists;
    } catch (e, strace) {
      print("Voici l'erreur : $e");
      print("Voici le strace : $strace");
    }

    return isCustomer;
  }

  Future<Customer?> getCustomer(Member member) async {
    Customer? customer;
    print("b");
    try {
      Map<String, dynamic>? mapMember =
          await memberServices.getDocumentToMap(document: member.memberId);
      print("bbbbb");
      Map<String, dynamic>? mapCustomer = await getDocumentToMap(
          whereField: FirestoreConstants.member, whereId: member.memberId);

      mapCustomer![FirestoreConstants.member] = mapMember;
      customer = Customer.basicFromMap(mapCustomer);
    } catch (e, strace) {
      print("Voici l'erreur : $e");
      print("Voici le strace : $strace");
    }
    return customer;
  }

  @override
  Future<List> getCollectionToMap() async {
    MemberServices memberServices = MemberServices();
    List l = await super.getCollectionToMap();
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
      String whereId = "",
      String whereField = ""}) async {
    Map<String, dynamic>? map = await super.getDocumentToMap(document: document, whereId: whereId, whereField: whereField);
    if(map != null && map!.isNotEmpty){
      MemberServices memberServices = MemberServices();
      Map<String, dynamic>? map2 =
      await memberServices.getDocumentToMap(document: map[FirestoreConstants.member]);
      map![FirestoreConstants.member] = map2;
    }
    return map;
  }
}
