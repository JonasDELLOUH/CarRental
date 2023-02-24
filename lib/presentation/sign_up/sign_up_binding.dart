import 'package:car_rental/presentation/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

import '../../app/getxservice/user_session_injected.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => UserSessionServiceInjected());
  }
}
