import 'package:car_rental/core/constants/firestore_constants.dart';
import 'package:get/get.dart';

import '../../core/models/car.dart';
import '../../core/models/car_brand.dart';
import '../../core/services/car_brand_services.dart';
import '../../core/services/car_services.dart';



class HomeController extends GetxController{
  RxList<CarBrand> carBrands = RxList<CarBrand>();
  RxList<Car> cars = RxList<Car>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCarBrands();
    await getCars();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getCarBrands() async {
    final carBrandServices = CarBrandService();
    List l = await carBrandServices.getCollectionToMap();
    carBrands.value = CarBrand.toList(l);
  }
  getCars() async {
    final carServices = CarServices();
    List l = await carServices.getCollectionToMap(limit: 5);
    cars.value = Car.toList(l);
  }

  getCarrWithCarBrand({required String carBrandId}) async{
    cars.value = [];
    final carServices = CarServices();
    List l = await carServices.getCollectionToMap(limit: 5, fieldName: FirestoreConstants.carBrand, value: carBrandId);
  }

}