import 'package:car_rental/constants/firestore_constants.dart';
import 'package:car_rental/services/base.dart';

class MemberServices extends BaseServices {
  MemberServices(){
    super.collectionName = FirestoreConstants.member;
  }
}