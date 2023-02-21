import 'package:car_rental/presentation/reservations/reservation_controller.dart';
import 'package:get/get.dart';

class ReservationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReservationController());
  }

}