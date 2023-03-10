import 'package:car_rental/presentation/car_details/car_details_controller.dart';
import 'package:get/get.dart';

import '../../app/getxservice/user_session_injected.dart';

class CarDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CarDetailsController());
    Get.lazyPut(() => UserSessionServiceInjected());
  }

}