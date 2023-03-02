import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/core/constants/firestore_constants.dart';
import 'package:get/get.dart';

import '../../core/models/location.dart';
import '../../core/services/location_services.dart';

class LocationController extends GetxController {
  RxList<Location> locations = RxList<Location>();
  final userSession = Get.find<UserSessionServiceInjected>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getLocations();
  }

  getLocations() async {
    isLoading.value = true;
    final locationsServices = LocationServices();
    List l = await locationsServices.getCollectionToMap(
        fieldName: FirestoreConstants.customer,
        value: userSession.customer.value!.customerId);
    isLoading.value = false;
    locations.value = Location.toList(l);
  }
}
