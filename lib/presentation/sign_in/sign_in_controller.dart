import 'package:car_rental/core/constants/const_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../app/env/links.dart';
import '../../app/getxservice/user_session_injected.dart';
import '../../core/services/auth_service.dart';
import '../../core/utility/functions.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController googleBtnController =
      RoundedLoadingButtonController();

  final AuthService _authService = AuthService();
  final userSession = Get.find<UserSessionServiceInjected>();

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      return true;
    }
  }

  signInWithGoogle() async {
    try {
      String? uid = await _authService.signInWithGoogle();
      if (uid != null) {
        userSession.getCurrentMember(userUid: uid);
        await saveSharedPref(ConstString.userUidPrefKey, uid);
      }
      googleBtnController.stop();
      appSnackBar("success", 'login_success'.tr, "");
      Get.toNamed(AppLinks.splash2Route);
    } on FirebaseAuthException catch (e, strace) {
      googleBtnController.stop();
      if (e.code == 'network-request-failed') {
        appSnackBar("error", 'failed'.tr, 'network_request_failed'.tr);
      } else {
        appSnackBar("error", 'failed'.tr, e.message);
      }
      print("Voici l'erreur : $e");
      print("Voici son strace : $strace");
    }
  }

  signInWithEmailAndPassword() async {
    try {
      String? uid = await _authService.signInEmailPassword(
          emailController.text, passwordController.text);
      if (uid != null) {
        userSession.getCurrentMember(userUid: uid);
        await saveSharedPref(ConstString.userUidPrefKey, uid);
      }
      btnController.stop();
      appSnackBar('success', "login_success".tr, "");
      Get.toNamed(AppLinks.splash2Route);
    } on FirebaseAuthException catch (e, strace) {
      btnController.stop();
      if (e.code == 'network-request-failed') {
        appSnackBar("error", 'failed'.tr, 'network_request_failed'.tr);
      } else if (e.code == 'wrong-password') {
        appSnackBar("error", 'failed'.tr, 'wrong_password'.tr);
      } else if (e.code == 'user-not-found') {
        appSnackBar("error", 'failed'.tr, 'user_not_found'.tr);
      }
      print("Voici l'erreur : $e");
      print("Voici son strace : $strace");
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
