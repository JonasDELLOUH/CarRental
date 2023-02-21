import 'package:get/get.dart';
class UserSessionServiceInjected extends GetxService {
  RxBool userIsCustomer = false.obs;


// Future<bool> verifyIsCustomer(Member member) async {
//   userIsCustomer.value = await _customerServices.isCustomer(member);
//   if (isCustomer.value) {
//     customer.value = await _customerServices.getCustomer(member);
//   }
//   return isCustomer.value;
// }
}