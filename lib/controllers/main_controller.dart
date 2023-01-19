import 'package:car_rental/services/car_brand_services.dart';
import 'package:car_rental/services/car_services.dart';
import 'package:car_rental/services/reservation_services.dart';
import 'package:get/get.dart';
import '../models/car.dart';
import '../models/car_brand.dart';
import '../models/customer.dart';
import '../models/member.dart';
import '../models/reservation.dart';
import '../services/customer_services.dart';

class MainController extends GetxController{
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
  Future<void> onInit() async {
    super.onInit();
    await getReservationDefault();
    await verifyIsCustomer(Member.defaultMember());
    await getCarListDefault();
    await getCarBrandListDefault();
  }
  Future<bool> verifyIsCustomer(Member member) async {
    isCustomer.value = await _customerServices.isCustomer(member);
    if (isCustomer.value) {
      customer.value = await _customerServices.getCustomer(member);
    }
    return isCustomer.value;
  }

  getCarListDefault() async {
    defaultCarList.value = await _carServices.getCars();
  }
  getReservationDefault() async {
    defaultReservationList.value = await _reservationServices.getReservations(customerId: Customer.defaultCustomer().member.memberId);
  }
  getCarBrandListDefault() async {
    defaultCarBrandList.value = await _carBrandService.getCarBrands();
  }
}