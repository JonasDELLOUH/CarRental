import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/presentation/settings/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => UserSessionServiceInjected());
  }

}