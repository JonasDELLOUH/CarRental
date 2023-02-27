import 'package:car_rental/presentation/rent/rent_controller.dart';
import 'package:get/get.dart';
class RentBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RentController());
  }
}