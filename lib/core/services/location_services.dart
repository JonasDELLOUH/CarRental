import 'package:car_rental/core/services/base.dart';
import 'package:car_rental/core/services/reservation_services.dart';

import '../constants/firestore_constants.dart';

class LocationServices extends BaseServices {
  LocationServices() {
    super.collectionName = FirestoreConstants.location;
  }

  @override
  Future<List> getCollectionToMap(
      {String fieldName = "", dynamic value}) async {
    ReservationServices reservationServices = ReservationServices();
    List l = await super.getCollectionToMap(fieldName: fieldName, value: value);
    for (dynamic location in l) {
      Map<String, dynamic>? map1 = await reservationServices.getDocumentToMap(
          document: location[FirestoreConstants.reservation]);
      location[FirestoreConstants.reservation] = map1;
    }
    return l;
  }

  @override
  Future<Map<String, dynamic>?> getDocumentToMap(
      {String document = "",
        String whereValue = "",
        String whereField = ""}) async {
    Map<String, dynamic>? map = await super.getDocumentToMap(
        document: document, whereValue: whereValue, whereField: whereField);
    if (map != null || map!.isNotEmpty) {
      ReservationServices reservationServices = ReservationServices();
      Map<String, dynamic>? map1 = await reservationServices.getDocumentToMap(
          document: map[FirestoreConstants.reservation]);
      map![FirestoreConstants.reservation] = map1;
    }
    return map;
  }
}
