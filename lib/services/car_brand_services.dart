import 'package:car_rental/constants/firestore_constants.dart';
import 'package:car_rental/models/car.dart';
import 'package:car_rental/services/base.dart';

class CarBrandService extends BaseServices {
  CarBrandService() {
    super.collectionName = FirestoreConstants.carBrand;
  }
}
