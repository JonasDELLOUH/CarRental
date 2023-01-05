import 'package:car_rental/services/base.dart';

import '../constants/firestore_constants.dart';

class AddressServices extends BaseServices {
  AddressServices(){
    super.collectionName = FirestoreConstants.address;
  }
}