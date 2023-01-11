import 'package:car_rental/constants/firestore_constants.dart';

import 'car.dart';
import 'customer.dart';

class Reservation {
  String reservationId;
  Customer customer;
  int reservationDate;
  Car car;

  Reservation(
      {required this.reservationId,
      required this.customer,
      required this.car,
      required this.reservationDate});

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.id: reservationId,
      FirestoreConstants.customer: customer.customerId,
      FirestoreConstants.reservationDate: DateTime.now().millisecondsSinceEpoch.toInt(),
      FirestoreConstants.car: car.carId
    };
  }

  factory Reservation.basicFromMap(Map<String, dynamic> map) {
    return Reservation(
        reservationId: map[FirestoreConstants.id],
        customer: Customer.basicFromCustomer(map[FirestoreConstants.customer]),
        car: Car.basicFromMap(map[FirestoreConstants.car]),
        reservationDate: map[FirestoreConstants.reservationDate]);
  }

  static Reservation defaultReservation() => Reservation(reservationId: "reservationId", customer: Customer.defaultCustomer(), car: Car.defaultCar(), reservationDate: DateTime.now().millisecond);
}
