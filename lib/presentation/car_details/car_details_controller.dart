import 'package:car_rental/app/env/links.dart';
import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:get/get.dart';

import '../../core/models/car.dart';

class CarDetailsController extends GetxController {
  final userSession = Get.find<UserSessionServiceInjected>();
  Rxn<Car> car = Rxn<Car>();

  @override
  void onInit() {
    super.onInit();
    car.value = Get.arguments;
  }

  redirectToPay() {
    if(!userSession.userIsCustomer.value){
      Get.toNamed(AppLinks.signUpAsCustomerRoute);
    } else{

    }
  }
}
