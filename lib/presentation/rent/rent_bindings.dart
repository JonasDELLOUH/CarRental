import 'package:car_rental/presentation/locations/location_controller.dart';
import 'package:car_rental/presentation/rent/rent_controller.dart';
import 'package:get/get.dart';

import '../../app/getxservice/user_session_injected.dart';
class RentBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RentController());
    Get.lazyPut(() => UserSessionServiceInjected());
    Get.lazyPut(() => LocationController());
  }
}