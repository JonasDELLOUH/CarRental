import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SettingsController extends GetxController {
  final List<SelectedListItem> listOfLanguages = [
    SelectedListItem(
      name: "english".tr,
      value: "en_US",
      isSelected: false,
    ),
    SelectedListItem(
      name: "french".tr,
      value: "fr_FR",
      isSelected: false,
    ),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  updateLanguage(String languageCode, String languageCountryCode){
    print(languageCode);
    print(languageCountryCode);
    Get.updateLocale(Locale(languageCode, languageCountryCode));

    // Get.updateLocale(const Locale('en', 'US'));
  }
}
