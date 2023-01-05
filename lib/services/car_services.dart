
import 'package:car_rental/constants/firestore_constants.dart';
import 'package:car_rental/services/base.dart';

class CarServices extends BaseServices{
  CarServices(){
    super.collectionName = FirestoreConstants.car;
  }

  addCar(){

  }

}