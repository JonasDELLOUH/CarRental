import 'package:car_rental/core/constants/colors.dart';
import 'package:car_rental/core/widgets/text_widgets.dart';
import 'package:car_rental/presentation/rent/rent_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';

class RentScreen extends StatelessWidget {
  RentScreen({Key? key}) : super(key: key);
  final controller = Get.find<RentController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ConstColors.secondaryColor,
        ),
        body: Container(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: Image.network(
                  controller.car.value!.carImageUrl,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: height,
                width: width,
                color: ConstColors.whiteColor.withOpacity(0.9),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.4),
                    myText(
                        text: 'nbr_rent_day'.tr, color: ConstColors.secondaryColor),
                    const SizedBox(
                      height: 20,
                    ),
                    InputQty(
                      maxVal: 10,
                      initVal: 1,
                      steps: 1,
                      showMessageLimit: true,
                      minVal: 1,
                      btnColor1: ConstColors.secondaryColor,
                      onQtyChanged: (val) {
                        controller.nbrDay.value = val!.toInt();
                        controller.updateTotal(val!.toInt());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    myText(
                        text: 'total'.tr,
                        color: ConstColors.secondaryColor,
                        fontSize: 40),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: width * 0.5,
                      decoration: BoxDecoration(border: Border.all(width: 2)),
                      child: Center(
                          child: Obx(() =>
                              myText(text: controller.total.value.toString()))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        controller.addLocation();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 50,
                        width: width * 0.45,
                        decoration: const BoxDecoration(
                            color: ConstColors.secondaryColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: Center(
                          child: myText(
                              text: 'pay'.tr,
                              color: ConstColors.backgroundColor),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
