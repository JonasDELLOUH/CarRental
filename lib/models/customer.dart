import 'package:car_rental/constants/firestore_constants.dart';

import 'member.dart';

class Customer {
  String customerId;
  Member member;
  String identityFileUrl;
  String memberImageUrl;

  Customer({required this.customerId, required this.member, required this.identityFileUrl, required this.memberImageUrl});

  factory Customer.basicFromCustomer(Map<String, dynamic> map){
    return Customer(customerId: map[FirestoreConstants.id], member: map[FirestoreConstants.member], identityFileUrl: map[FirestoreConstants.identityFileUrl], memberImageUrl: map[FirestoreConstants.memberImageUrl]);
  }

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.memberImageUrl: customerId,
      FirestoreConstants.member: member.memberId,
      FirestoreConstants.identityFileUrl: identityFileUrl,
      FirestoreConstants.memberImageUrl: memberImageUrl
    };
  }

}