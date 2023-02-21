
import '../constants/firestore_constants.dart';
import 'base.dart';

class AddressServices extends BaseServices {
  AddressServices(){
    super.collectionName = FirestoreConstants.address;
  }
}