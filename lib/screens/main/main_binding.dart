import 'package:car_rental/controllers/main_controller.dart';
import 'package:car_rental/services/car_brand_services.dart';
import 'package:car_rental/services/car_services.dart';
import 'package:get/get.dart';

import '../../services/customer_services.dart';
import '../../services/reservation_services.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => CustomerServices());
    Get.lazyPut(() => CarServices());
    Get.lazyPut(() => CarBrandService());
    Get.lazyPut(() => ReservationServices());
  }
}
