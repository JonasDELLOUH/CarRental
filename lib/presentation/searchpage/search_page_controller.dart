import 'package:get/get.dart';

import '../../core/models/car.dart';
import '../../core/services/car_services.dart';

class SearchPageController extends GetxController{
  RxInt choice = 1.obs;
  RxString values = "".obs;
  Rxn<List<Car>> cars = Rxn<List<Car>>();
  CarServices carServices = CarServices();

  @override
  Future<void> onInit() async {
    cars.value = [];
    super.onInit();
    List l = await carServices.getCollectionToMap();
    cars.value = Car.toList(l);
  }
}