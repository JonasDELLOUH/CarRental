import 'package:car_rental/presentation/searchpage/search_page_controller.dart';
import 'package:get/get.dart';

class SearchPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPageController());
  }
}
