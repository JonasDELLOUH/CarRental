import 'package:car_rental/presentation/sign_up_as_customer/sign_up_as_customer_controller.dart';
import 'package:get/get.dart';
class SignUpAsCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpAsCustomerController());
  }
}