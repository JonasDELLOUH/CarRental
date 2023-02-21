import 'package:get/get.dart';


class MainController extends GetxController{


  RxInt selectedWidgetIndex = 1.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  // Future<bool> verifyIsCustomer(Member member) async {
  //   isCustomer.value = await _customerServices.isCustomer(member);
  //   if (isCustomer.value) {
  //     customer.value = await _customerServices.getCustomer(member);
  //   }
  //   return isCustomer.value;
  // }
  //
  // getCarListDefault() async {
  //   defaultCarList.value = await _carServices.getCars();
  // }
  // getReservationDefault() async {
  //   defaultReservationList.value = await _reservationServices.getReservations(customerId: Customer.defaultCustomer().member.memberId);
  // }
  // getCarBrandListDefault() async {
  //   defaultCarBrandList.value = await _carBrandService.getCarBrands();
  // }
}