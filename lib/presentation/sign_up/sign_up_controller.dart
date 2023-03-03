import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/core/utility/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../app/env/links.dart';
import '../../core/services/auth_service.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  final userSession = Get.find<UserSessionServiceInjected>();

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController googleBtnController =
      RoundedLoadingButtonController();

  final AuthService _authService = AuthService();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  signInWithGoogle() async {
    try {
      String? uid = await _authService.signInWithGoogle();
      if (uid != null) {
        userSession.getCurrentMember(userUid: uid);
      }
      googleBtnController.stop();
      appSnackBar("success", 'login_success'.tr, "");
      Get.offAllNamed(AppLinks.splash2Route);
    } on FirebaseAuthException catch (e, strace) {
      googleBtnController.stop();
      if (e.code == 'network-request-failed') {
        appSnackBar("error", 'failed'.tr, 'network_request_failed'.tr);
      } else {
        appSnackBar("error", 'failed'.tr, e.message);
      }
      print("Voici l'erreur : $e");
      if (true) {}
      print("Voici son strace : $strace");
    }
  }

  signUp() async {
    try {
      await _authService.createUser(
          email: emailController.text,
          password: passwordController.text,
          fullName: fullNameController.text,
          phoneNumber: phoneController.text);
      btnController.stop();
      appSnackBar('success', "sign_up_ok".tr, "");
      Get.offAndToNamed(AppLinks.signInRoute);
    } on FirebaseAuthException catch (e, strace) {
      btnController.stop();
      if (e.code == 'weak-password') {
        appSnackBar("error", 'failed'.tr, 'weak_password'.tr);
      } else if (e.code == 'email-already-in-use') {
        appSnackBar("error", 'failed'.tr, 'email_already_in_use'.tr);
      } else if (e.code == 'network-request-failed') {
        appSnackBar("error", 'failed'.tr, 'network_request_failed'.tr);
      } else {
        appSnackBar("error", 'failed'.tr, e.message);
      }
      print("Voici l'erreur : $e");
      if (true) {}
      print("Voici son strace : $strace");
    }
  }
}
