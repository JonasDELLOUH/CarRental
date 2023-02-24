import 'package:car_rental/presentation/splash2/splash2_controller.dart';
import 'package:get/get.dart';

class Splash2Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<Splash2Controller>(Splash2Controller());
  }
}
