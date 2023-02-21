
import '../constants/firestore_constants.dart';

class Member {
  String memberId;
  String email;
  String phoneNumber;
  String fullName;

  Member(
      {required this.memberId,
      required this.email,
      required this.phoneNumber,
      required this.fullName});

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.id: memberId,
      FirestoreConstants.memberEmail: email,
      FirestoreConstants.memberFullName: fullName,
      FirestoreConstants.memberPhoneNumber: phoneNumber
    };
  }

  factory Member.basicFromMap(Map<String, dynamic> map) {
    return Member(
        memberId: map[FirestoreConstants.id],
        email: map[FirestoreConstants.memberEmail],
        phoneNumber: map[FirestoreConstants.memberPhoneNumber],
        fullName: map[FirestoreConstants.memberFullName]);
  }

  static Member defaultMember() => Member(
      memberId: "Mn3SqQDHMQAPsE3jBcXF",
      email: "jdellouh1@gmail.com",
      phoneNumber: "96133525",
      fullName: "DELLOUH Jonas");


}
