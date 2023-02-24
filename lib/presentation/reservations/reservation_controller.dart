import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/core/constants/firestore_constants.dart';
import 'package:get/get.dart';

import '../../core/models/reservation.dart';
import '../../core/services/reservation_services.dart';

class ReservationController extends GetxController {
  RxList<Reservation> reservations = RxList<Reservation>();
  final userSession = Get.find<UserSessionServiceInjected>();

  @override
  void onInit() {
    super.onInit();
    getReservations();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  getReservations() async {
    final reservationServices = ReservationServices();
    List l = await reservationServices.getCollectionToMap(
        fieldName: FirestoreConstants.customer,
        value: userSession.customer.value!.customerId);
    reservations.value = Reservation.toList(l);
  }
}
