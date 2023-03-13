import '../constants/firestore_constants.dart';
import 'car.dart';
import 'customer.dart';

class Location {
  String locationId;
  Customer customer;
  int locationDate;
  Car car;
  int nbrDayOfRent;
  bool isReleased;

  Location(
      {required this.locationId,
      required this.customer,
      required this.car,
      required this.locationDate,
      required this.nbrDayOfRent,
      required this.isReleased});

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.id: locationId,
      FirestoreConstants.customer: customer.customerId,
      FirestoreConstants.locationDate:
          DateTime.now().millisecondsSinceEpoch.toInt(),
      FirestoreConstants.car: car.carId,
      FirestoreConstants.isReleased: isReleased
    };
  }

  factory Location.basicFromMap(Map<String, dynamic> map) {
    return Location(
        locationId: map[FirestoreConstants.id],
        customer: Customer.basicFromMap(map[FirestoreConstants.customer]),
        car: Car.basicFromMap(map[FirestoreConstants.car]),
        locationDate: map[FirestoreConstants.locationDate],
        nbrDayOfRent: map[FirestoreConstants.nbrDayOfRent],
        isReleased: map[FirestoreConstants.isReleased]);
  }

  static List<Location> toList(List jsonData) {
    List<Location> reservations = [];
    for (dynamic data in jsonData) {
      reservations.add(Location.basicFromMap(data));
    }
    return reservations;
  }

  static Location defaultReservation() => Location(
      locationId: "reservationId",
      customer: Customer.defaultCustomer(),
      car: Car.defaultCar(),
      locationDate: DateTime.now().millisecond,
      nbrDayOfRent: 2,
      isReleased: false);
}
