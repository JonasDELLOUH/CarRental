import 'package:get/get.dart';

import '../../app/env/links.dart';

class Splash2Controller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(const Duration(seconds: 1), () {
      Get.offNamed(AppLinks.mainRoute);
    });
  }

// Future<bool> verifyIsCustomer(Member member) async {
//   isCustomer.value = await _customerServices.isCustomer(member);
//   if (isCustomer.value) {
//     customer.value = await _customerServices.getCustomer(member);
//   }
//   return isCustomer.value;
// }

}
