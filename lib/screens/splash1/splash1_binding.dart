
import 'package:car_rental/controllers/splash1_controller.dart';
import 'package:car_rental/screens/splash1/splash1_screen.dart';
import 'package:get/get.dart';

class Splash1Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => const Splash1Screen());
    Get.lazyPut(() => Splash1Controller());
  }

}