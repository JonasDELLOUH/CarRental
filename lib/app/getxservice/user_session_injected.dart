import 'package:car_rental/core/constants/firestore_constants.dart';
import 'package:car_rental/core/services/customer_services.dart';
import 'package:car_rental/core/services/member_services.dart';
import 'package:get/get.dart';

import '../../core/models/customer.dart';
import '../../core/models/member.dart';

class UserSessionServiceInjected extends GetxService {
  RxBool userIsCustomer = false.obs;
  Rxn<Member> member = Rxn<Member>();
  Rxn<Customer> customer = Rxn<Customer>();
  MemberServices memberServices = MemberServices();
  CustomerServices customerServices = CustomerServices();

  getCurrentMember({required String userUid}) async {
    Map<String, dynamic>? map = {};
    map = await memberServices.getDocumentToMap(
        whereField: FirestoreConstants.id, whereValue: userUid);
    if (map != null) {
      member.value = Member.basicFromMap(map);
      verifyIsCustomer(userUid);
    }
  }

  verifyIsCustomer(String memberId) async {
    userIsCustomer.value = await customerServices.isExist(FirestoreConstants.member, memberId);
    if (userIsCustomer.value == true) {
      Map<String, dynamic>? map = await customerServices.getDocumentToMap(whereField: FirestoreConstants.member, whereValue: memberId);
      customer.value = Customer.basicFromMap(map!);
    }
  }


}
