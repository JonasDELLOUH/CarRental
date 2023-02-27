import 'package:get/get.dart';

import '../../app/getxservice/user_session_injected.dart';
import '../../core/models/car.dart';

class RentController extends GetxController {
  final userSession = Get.find<UserSessionServiceInjected>();
  Rxn<Car> car = Rxn<Car>();
  RxDouble total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    car.value = Get.arguments;
    total.value = car.value!.rentalPrice;
  }

  updateTotal(int nbrDay){
    total.value = car.value!.rentalPrice * nbrDay;
  }
}
