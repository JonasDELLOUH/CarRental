import 'package:car_rental/app/env/links.dart';
import 'package:car_rental/core/services/car_services.dart';
import 'package:car_rental/core/services/location_services.dart';
import 'package:car_rental/presentation/locations/location_controller.dart';
import 'package:get/get.dart';
import '../../app/getxservice/user_session_injected.dart';
import '../../core/constants/firestore_constants.dart';
import '../../core/models/car.dart';
import '../../core/utility/functions.dart';

class RentController extends GetxController {
  final userSession = Get.find<UserSessionServiceInjected>();
  final locationController = Get.find<LocationController>();
  Rxn<Car> car = Rxn<Car>();
  RxInt total = 0.obs;
  LocationServices locationServices = LocationServices();
  CarServices carServices = CarServices();
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
      FirestoreConstants.isReleased: false
    };

    await locationServices.addToFirebase(map);
    car.value!.isRented = true;
    await carServices.updateData(car.value!.toMap());
    appSnackBar("success", "location_added".tr, "");
    locationController.getLocations();
    Get.offAndToNamed(AppLinks.mainRoute);
  }

  Future<void> successCallback(response, context) async {
    // Navigator.pop(context);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => SuccessScreen(
    //           amount: response['requestData']['amount'],
    //           transactionId: response['transactionId']
    //       )),
    // );
  }
}
