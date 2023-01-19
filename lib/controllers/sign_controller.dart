import 'package:car_rental/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../env/links.dart';

class SignController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLogged = false.obs;
  RxBool loggingFail = false.obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthService _authService = Get.find();

  bool validate() {
    if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
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
    isLoading.value = true;
    try {
      await _authService.signInWithGoogle();
      isLogged.value = true;
    isLoading.value = false;
      Get.snackbar("Connexion", "Vous êtes connecté", snackPosition: SnackPosition.BOTTOM);
      Get.toNamed(AppLinks.mainScreen);
    } catch (e, strace) {
      isLoading.value = false;
      loggingFail.value = true;
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
