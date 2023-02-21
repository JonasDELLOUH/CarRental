import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../app/env/links.dart';
import '../../core/services/auth_service.dart';


class SignInController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLogged = false.obs;
  RxBool loggingFail = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RoundedLoadingButtonController btnController =
  RoundedLoadingButtonController();

  final AuthService _authService = AuthService();

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
    isLoading.value = true;
    try {
      await _authService.signInWithGoogle();
      isLogged.value = true;
    isLoading.value = false;
      Get.snackbar("Connexion", "Vous êtes connecté", snackPosition: SnackPosition.BOTTOM);
      Get.toNamed(AppLinks.mainRoute);
    } catch (e, strace) {
      isLoading.value = false;
      loggingFail.value = true;
      print("Voici l'erreur : $e");
      print("Voici son strace : $strace");
    }
  }

  signInWithEmailAndPassword() async{
    try{
      await _authService.signInEmailPassword(emailController.text, passwordController.text);
    }catch(e, strace) {
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
