
import 'package:car_rental/presentation/sign_in/sign_controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    // Get.lazyPut(() => AuthService());
  }
}