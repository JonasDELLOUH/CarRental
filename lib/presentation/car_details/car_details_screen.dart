import 'package:car_rental/presentation/car_details/car_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/my_icons.dart';
import '../../core/models/car.dart';
import '../../core/utility/car_carac_card.dart';
import '../../core/utility/car_card.dart';
import '../../core/widgets/read_more.dart';
import '../../core/widgets/text_widgets.dart';

class CarDetailsScreen extends StatelessWidget {
  CarDetailsScreen({Key? key, Car? car}) : super(key: key);

  final controller = Get.find<CarDetailsController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: MyIcons.leadingIcon(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myText(
                  text:
                      "${controller.car.value!.carBrand.carBrandName} ${controller.car.value!.carModel}",
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: stars(controller.car.value!.nbrStars, size: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: Image.network(
                  controller.car.value!.carImageUrl,
                  height: width * 0.7,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              myText(text: "overview".tr, fontWeight: FontWeight.w400),
              const SizedBox(
                height: 5,
              ),
              readmore(text: controller.car.value!.overview),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CarCaracCard(
                      carac: "${controller.car.value!.carSpeed} km/h",
                      caracIconData: MyIcons.speedIconData(),
                      width: width * 0.15),
                  CarCaracCard(
                      carac: "${controller.car.value!.nbrPlaces} ${'seats'.tr}",
                      caracIconData: MyIcons.seatIconData(),
                      width: width * 0.15),
                  CarCaracCard(
                      carac: controller.car.value!.isReserved
                          ? 'reserved'.tr
                          : 'available'.tr,
                      caracIconData: controller.car.value!.isReserved
                          ? MyIcons.reserveIconData()
                          : MyIcons.availableIconData(),
                      width: width * 0.15)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  myText(
                      text:
                          "${controller.car.value!.rentalPrice} cfa / ${'day'.tr}",
                      fontSize: 15),
                  InkWell(
                    onTap: () {
                      controller.redirectToRent();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      // width: width * 0.45,
                      decoration: const BoxDecoration(
                          color: ConstColors.blueColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Center(
                        child: myText(
                            text: 'rent_now'.tr,
                            color: ConstColors.backgroundColor),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
