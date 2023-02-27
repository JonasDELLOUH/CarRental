import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/presentation/locations/location_controller.dart';
import 'package:get/get.dart';

class LocationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => UserSessionServiceInjected());
  }

}