import 'dart:io';

import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/core/constants/firestore_constants.dart';
import 'package:car_rental/core/services/customer_services.dart';
import 'package:car_rental/core/utility/functions.dart';
import 'package:get/get.dart';

class SignUpAsCustomerController extends GetxController {
  Rxn<File> identityFile = Rxn<File>();
  Rxn<File> memberImage = Rxn<File>();
  CustomerServices customerServices = CustomerServices();
  final userSession = Get.find<UserSessionServiceInjected>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  signUpAsCustomer() async {
    if (identityFile.value == null) {
      appSnackBar("error", "need_identity_file".tr, "");
    } else if (memberImage.value == null) {
      appSnackBar("error", "need_profile_image".tr, '');
    } else {
      Map<String, dynamic> map = {
        FirestoreConstants.member: userSession.member.value!.memberId,
      };
      customerServices
          .addToFirebase(map,
              file: identityFile.value, file2: memberImage.value)
          .then((value) {
        userSession.getCurrentMember(
            userUid: userSession.member.value!.memberId);
      });
    }
  }
}
