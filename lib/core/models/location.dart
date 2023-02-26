import 'package:car_rental/core/constants/firestore_constants.dart';
import 'package:car_rental/core/models/reservation.dart';

class Location {
  Reservation reservation;
  String locationId;

  Location({required this.reservation, required this.locationId});

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.id: locationId,
      FirestoreConstants.reservation: reservation.reservationId
    };
  }

  factory Location.basicFromMap(Map<String, dynamic> map) {
    return Location(
        reservation:
            Reservation.basicFromMap(map[FirestoreConstants.reservation]),
        locationId: map[FirestoreConstants.id]);
  }

  static List<Location> toList(List jsonData) {
    List<Location> locations = [];
    for (dynamic data in jsonData) {
      locations.add(Location.basicFromMap(data));
    }
    return locations;
  }
}
