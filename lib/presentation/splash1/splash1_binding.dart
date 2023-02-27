
import 'package:car_rental/presentation/splash1/splash1_controller.dart';
import 'package:car_rental/presentation/splash1/splash1_screen.dart';
import 'package:get/get.dart';

import '../../app/getxservice/user_session_injected.dart';

class Splash1Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Splash1Controller());
    Get.lazyPut(() => UserSessionServiceInjected());
  }

}