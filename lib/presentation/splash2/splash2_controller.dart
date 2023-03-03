import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:get/get.dart';

import '../../app/env/links.dart';
import '../../core/constants/const_strings.dart';
import '../../core/utility/functions.dart';

class Splash2Controller extends GetxController {
  final userSession = Get.find<UserSessionServiceInjected>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await userSession.getCurrentMember(userUid: userSession.userUId.value);
    await saveSharedPref(ConstString.userUidPrefKey, userSession.userUId.value);
    Get.offAndToNamed(AppLinks.mainRoute);
  }

// Future<bool> verifyIsCustomer(Member member) async {
//   isCustomer.value = await _customerServices.isCustomer(member);
//   if (isCustomer.value) {
//     customer.value = await _customerServices.getCustomer(member);
//   }
//   return isCustomer.value;
// }

}
