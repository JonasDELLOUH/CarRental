import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/core/constants/const_strings.dart';
import 'package:car_rental/core/utility/functions.dart';
import 'package:get/get.dart';

import '../../app/env/links.dart';

class Splash1Controller extends GetxController {
  final userSession = Get.find<UserSessionServiceInjected>();

  @override
  Future<void> onReady() async {
    super.onReady();
    Future.delayed(const Duration(seconds: 1), () async {
      String uid = await getSharedPrefReturn(ConstString.userUidPrefKey);
      if (uid.isNotEmpty && uid != "null") {
        try{
          userSession.getCurrentMember(userUid: uid);
        } catch(e, strace){
          Get.toNamed(AppLinks.signInRoute);
        }
        Get.toNamed(AppLinks.splash2Route);
      } else {
        Get.toNamed(AppLinks.signInRoute);
      }
    });
  }
}
