import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/presentation/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => UserSessionServiceInjected());
  }

}