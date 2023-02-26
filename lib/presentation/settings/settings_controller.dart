import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{
  final List<SelectedListItem> listOfCities = [
    SelectedListItem(
      name: "Élevé",
      value: "high",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Moyen",
      value: "medium",
      isSelected: false,
    ),
  ];
}