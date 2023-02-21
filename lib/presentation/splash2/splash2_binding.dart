
import 'package:car_rental/presentation/splash2/splash2_controller.dart';
import 'package:car_rental/presentation/splash2/splash2_screen.dart';
import 'package:get/get.dart';

import '../../core/services/car_brand_services.dart';
import '../../core/services/car_services.dart';
import '../../core/services/customer_services.dart';
import '../../core/services/reservation_services.dart';


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