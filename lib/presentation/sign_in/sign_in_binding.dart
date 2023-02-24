import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/presentation/sign_in/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => UserSessionServiceInjected());
  }
}
