import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/presentation/splash2/splash2_controller.dart';
import 'package:get/get.dart';

class Splash2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Splash2Controller());
    Get.lazyPut(() => UserSessionServiceInjected());
  }
}
