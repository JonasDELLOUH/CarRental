import 'package:car_rental/presentation/locations/locations_controller.dart';
import 'package:get/get.dart';

class LocationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationsController());
  }
}
