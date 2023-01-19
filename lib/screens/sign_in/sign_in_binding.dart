
import 'package:car_rental/controllers/sign_controller.dart';
import 'package:car_rental/services/auth_service.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignController());
    Get.lazyPut(() => AuthService());
  }
}