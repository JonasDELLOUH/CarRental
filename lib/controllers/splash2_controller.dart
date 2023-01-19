import 'package:car_rental/env/links.dart';
import 'package:get/get.dart';

import '../models/car.dart';
import '../models/car_brand.dart';
import '../models/customer.dart';
import '../models/member.dart';
import '../models/reservation.dart';
import '../services/car_brand_services.dart';
import '../services/car_services.dart';
import '../services/customer_services.dart';
import '../services/reservation_services.dart';

class Splash2Controller extends GetxController{

  RxBool inLoading = false.obs;
  Rxn<Member> member = Rxn();
  Rxn<Customer> customer = Rxn();
  RxBool isCustomer = false.obs;
  Rxn<List<Car>> defaultCarList = Rxn();
  Rxn<List<CarBrand>> defaultCarBrandList = Rxn();
  Rxn<List<Reservation>> defaultReservationList = Rxn();
  final CustomerServices _customerServices = Get.find();
  final CarServices _carServices = Get.find();
  final CarBrandService _carBrandService = Get.find();
  final ReservationServices _reservationServices = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    getReservationDefault().then((value) {
      verifyIsCustomer(Member.defaultMember()).then((value) {
        getCarListDefault().then((value) {
          getCarBrandListDefault().then((value) {
            Get.toNamed(AppLinks.mainScreen);
          });
        });
      });
    });
  }
  Future<bool> verifyIsCustomer(Member member) async {
    isCustomer.value = await _customerServices.isCustomer(member);
    if (isCustomer.value) {
      customer.value = await _customerServices.getCustomer(member);
    }
    return isCustomer.value;
  }

  Future getCarListDefault() async {
    defaultCarList.value = await _carServices.getCars();
  }
  Future getReservationDefault() async {
    defaultReservationList.value = await _reservationServices.getReservations(customerId: Customer.defaultCustomer().member.memberId);
  }
  Future getCarBrandListDefault() async {
    defaultCarBrandList.value = await _carBrandService.getCarBrands();
  }
}