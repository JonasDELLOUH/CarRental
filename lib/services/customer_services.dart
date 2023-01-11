import 'package:car_rental/constants/firestore_constants.dart';
import 'package:car_rental/services/base.dart';

class CustomerServices extends BaseServices {
  CustomerServices(){
    super.collectionName = FirestoreConstants.customer;
  }
}