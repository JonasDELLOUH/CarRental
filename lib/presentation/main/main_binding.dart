import 'package:car_rental/presentation/home/home_controller.dart';
import 'package:car_rental/presentation/main/main_controller.dart';
import 'package:get/get.dart';

import '../locations/location_controller.dart';
import '../settings/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => SettingsController());
  }
}
