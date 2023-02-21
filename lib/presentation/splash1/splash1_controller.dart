import 'package:get/get.dart';

import '../../app/env/links.dart';

class Splash1Controller extends GetxController{
  @override
  Future<void> onReady() async {
    super.onReady();
    Future.delayed(const Duration(seconds: 1), (){
      Get.toNamed(AppLinks.signInRoute);
    });
  }

}