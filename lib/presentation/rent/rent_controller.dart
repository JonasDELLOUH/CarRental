import 'package:car_rental/app/env/links.dart';
import 'package:car_rental/core/services/location_services.dart';
import 'package:get/get.dart';

import '../../app/getxservice/user_session_injected.dart';
import '../../core/constants/firestore_constants.dart';
import '../../core/models/car.dart';
import '../../core/utility/functions.dart';

class RentController extends GetxController {
  final userSession = Get.find<UserSessionServiceInjected>();
  Rxn<Car> car = Rxn<Car>();
  RxDouble total = 0.0.obs;
  LocationServices locationServices = LocationServices();
  RxInt nbrDay = 1.obs;

  @override
  void onInit() {
    super.onInit();
    car.value = Get.arguments;
    total.value = car.value!.rentalPrice;
  }

  updateTotal(int nbrDay) {
    total.value = car.value!.rentalPrice * nbrDay;
  }

  addLocation() async {
    Map<String, dynamic> map = {
      FirestoreConstants.customer: userSession.customer.value!.customerId,
      FirestoreConstants.nbrDayOfRent: nbrDay.value,
      FirestoreConstants.locationDate: DateTime.now().millisecondsSinceEpoch,
      FirestoreConstants.car: car.value!.carId,
    };

    await locationServices.addToFirebase(map);
    appSnackBar("success", "location_added".tr, "");
    Get.offAndToNamed(AppLinks.mainRoute);
  }
}
