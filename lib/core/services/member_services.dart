
import '../constants/firestore_constants.dart';
import 'base.dart';

class MemberServices extends BaseServices {
  MemberServices(){
    super.collectionName = FirestoreConstants.member;
  }

}