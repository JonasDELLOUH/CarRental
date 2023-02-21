import 'package:car_rental/presentation/home/home_controller.dart';
import 'package:car_rental/presentation/main/main_controller.dart';
import 'package:car_rental/presentation/reservations/reservation_controller.dart';
import 'package:get/get.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ReservationController());
  }
}
