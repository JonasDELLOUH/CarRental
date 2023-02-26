import 'dart:io';

import 'package:car_rental/core/services/customer_services.dart';
import 'package:car_rental/core/services/member_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../app/getxservice/user_session_injected.dart';

class ProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Rxn<File> memberImage = Rxn<File>();
  final userSession = Get.find<UserSessionServiceInjected>();
  MemberServices memberServices = MemberServices();
  CustomerServices customerServices = CustomerServices();

  @override
  void onInit() {
    super.onInit();
    fullNameController.text = userSession.member.value!.fullName;
    phoneController.text = userSession.member.value!.phoneNumber;
  }

  updateMemberName() async {
    if (userSession.member.value!.fullName != fullNameController.text) {
      userSession.member.value!.fullName = fullNameController.text;
      await memberServices.updateData(userSession.member.value!.toMap());
    }
  }

  updateMemberPhone() async {
    if (userSession.member.value!.phoneNumber != phoneController.text) {
      userSession.member.value!.phoneNumber = phoneController.text;
      await memberServices.updateData(userSession.member.value!.toMap());
    }
  }

  updateCustomerImage() async {
    if (memberImage.value != null) {
      await customerServices.updateData(userSession.customer.value!.toMap(),
          file: memberImage.value);
    }
  }
}
