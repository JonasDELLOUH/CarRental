
import 'package:car_rental/controllers/splash2_controller.dart';
import 'package:car_rental/screens/splash2/splash2_screen.dart';
import 'package:get/get.dart';

import '../../services/car_brand_services.dart';
import '../../services/car_services.dart';
import '../../services/customer_services.dart';
import '../../services/reservation_services.dart';

class Splash2Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => const Splash2Screen());
    Get.lazyPut(() => CustomerServices());
    Get.lazyPut(() => CarServices());
    Get.lazyPut(() => CarBrandService());
    Get.lazyPut(() => ReservationServices());
    Get.put<Splash2Controller>(Splash2Controller());
  }
  
}