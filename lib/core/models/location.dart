import '../constants/firestore_constants.dart';
import 'car.dart';
import 'customer.dart';

class Location {
  String locationId;
  Customer customer;
  int locationDate;
  Car car;
  int nbrDayOfRent;

  Location(
      {required this.locationId,
      required this.customer,
      required this.car,
      required this.locationDate, required this.nbrDayOfRent});

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.id: locationId,
      FirestoreConstants.customer: customer.customerId,
      FirestoreConstants.locationDate:
          DateTime.now().millisecondsSinceEpoch.toInt(),
      FirestoreConstants.car: car.carId
    };
  }

  factory Location.basicFromMap(Map<String, dynamic> map) {
    return Location(
        locationId: map[FirestoreConstants.id],
        customer: Customer.basicFromMap(map[FirestoreConstants.customer]),
        car: Car.basicFromMap(map[FirestoreConstants.car]),
        locationDate: map[FirestoreConstants.locationDate], nbrDayOfRent: map[FirestoreConstants.nbrDayOfRent]);
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
    nbrDayOfRent: 2
  );
}
