import 'package:car_rental/constants/firestore_constants.dart';

import 'member.dart';

class Customer {
  String customerId;
  Member member;
  String identityFileUrl;
  String memberImageUrl;

  Customer(
      {required this.customerId,
      required this.member,
      required this.identityFileUrl,
      required this.memberImageUrl});

  factory Customer.basicFromCustomer(Map<String, dynamic> map) {
    return Customer(
        customerId: map[FirestoreConstants.id],
        member: Member.basicFromMap(map[FirestoreConstants.member]),
        identityFileUrl: map[FirestoreConstants.imageUrl],
        memberImageUrl: map[FirestoreConstants.imageUrl2]);
  }

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.id: customerId,
      FirestoreConstants.member: member.memberId,
      FirestoreConstants.imageUrl: identityFileUrl,
      FirestoreConstants.imageUrl2: memberImageUrl
    };
  }

  static Customer defaultCustomer() => Customer(
      customerId: "bqNpLYgSdcQOL6oaoQHV",
      member: Member.defaultMember(),
      identityFileUrl:
          "https://firebasestorage.googleapis.com/v0/b/carrental-89ac9.appspot.com/o/customer%2FbqNpLYgSdcQOL6oaoQHV?alt=media&token=6fb1c322-fa0e-42d9-a8eb-996832b41fc4",
      memberImageUrl:
          "https://firebasestorage.googleapis.com/v0/b/carrental-89ac9.appspot.com/o/customer%2FbqNpLYgSdcQOL6oaoQHV?alt=media&token=8698f721-55fb-49bb-9c20-c27b96f4c939");
}
