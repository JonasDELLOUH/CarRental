import 'package:car_rental/core/constants/colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isEmailValid(String email) {
  String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regExp = RegExp(emailPattern);
  return regExp.hasMatch(email);
}

appSnackBar(String type, title, message) {
  switch (type) {
    case "success":
      Get.snackbar(title, message,
          snackPosition: SnackPosition.TOP,
          colorText: ConstColors.whiteColor,
          backgroundColor: ConstColors.greenColor);
      break;
    case "error":
      Get.snackbar(title, message,
          snackPosition: SnackPosition.TOP,
          colorText: ConstColors.whiteColor,
          backgroundColor: ConstColors.redColor);
      break;
  }
}

Future<String> getSharedPrefReturn(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key).toString();
}

Future<void> saveSharedPref(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value.toString());
}

Future<void> removeSharedPref(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Remove data for the key.
  await prefs.remove(key);
}
