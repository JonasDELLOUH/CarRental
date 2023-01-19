import 'package:car_rental/constants/firestore_constants.dart';
import 'package:car_rental/models/customer.dart';
import 'package:car_rental/services/base.dart';
import 'package:car_rental/services/member_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/member.dart';

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
          await memberServices.getDataToMap(document: member.memberId);
      print("bbbbb");
      Map<String, dynamic>? mapCustomer = await getDataToMap(
          whereField: FirestoreConstants.member, whereId: member.memberId);

      mapCustomer![FirestoreConstants.member] = mapMember;
      customer = Customer.basicFromMap(mapCustomer);
    } catch (e, strace) {
      print("Voici l'erreur : $e");
      print("Voici le strace : $strace");
    }
    return customer;
  }
}
