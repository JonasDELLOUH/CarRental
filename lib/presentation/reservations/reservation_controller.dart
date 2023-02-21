import 'package:get/get.dart';

import '../../core/models/reservation.dart';
import '../../core/services/reservation_services.dart';

class ReservationController extends GetxController {
  RxList<Reservation> reservations = RxList<Reservation>();

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
    List l = await reservationServices.getCollectionToMap();
    reservations.value = Reservation.toList(l);
  }
}
