import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpAsCustomerController extends GetxController {
  Rxn<File> identityFile = Rxn<File>();
  Rxn<File> memberImage = Rxn<File>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
