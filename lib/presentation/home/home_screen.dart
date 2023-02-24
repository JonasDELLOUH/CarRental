import 'package:car_rental/app/env/links.dart';
import 'package:car_rental/presentation/home/home_controller.dart';

import 'package:car_rental/presentation/car_details/car_details_screen.dart';
import 'package:car_rental/presentation/searchpage/search_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/my_icons.dart';
import '../../core/models/car.dart';
import '../../core/models/car_brand.dart';
import '../../core/services/car_brand_services.dart';
import '../../core/services/car_services.dart';
import '../../core/utility/car_brand_card.dart';
import '../../core/utility/car_card.dart';
import '../../core/utility/size_utils.dart';
import '../../core/widgets/common_loading.dart';
import '../../core/widgets/text_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
  CarServices carServices = CarServices();
  CarBrandService carBrandService = CarBrandService();
  Car? car;
  List<Car> cars = [];
  List<CarBrand> carBrands = [];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        // leading: null,
        title: const Text("RENTALCAR"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.17,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: ConstColors.backgroundColor,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: ConstColors.primaryColor.withOpacity(0.3),
                        offset: const Offset(0.0, 3.0),
                        blurRadius: 1,
                      ),
                    ]),
                child: Column(
                  children: [
                    richText(
                        text: 'home_express1'.tr,
                        color: ConstColors.blueColor,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 10,
                    ),
                    richText(text: 'home_express2'.tr, fontSize: 15),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: ConstColors.primaryColor.withOpacity(0.4),
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(25),
                            left: Radius.circular(25)),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage()));
                        },
                        child: Row(
                          children: [
                            MyIcons.searchIcon(size: 30),
                            const SizedBox(
                              width: 10,
                            ),
                            myText(
                                text: 'searchpage'.tr,
                                color: ConstColors.whiteColor.withOpacity(0.7))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              myText(text: 'best_brand'.tr, fontWeight: FontWeight.bold),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: height * 0.09,
                child: Obx(() => controller.carBrands.isEmpty
                    ? Container()
                    : carBrandsView(
                        context: context, carBrands: controller.carBrands)),
              ),
              Container(
                height: height * 0.51,
                // color: Colors.blue,
                // child: StreamBuilder<List<Car>>(
                //         stream: carServices.getCarsStream(),
                //         builder: (BuildContext context,
                //             AsyncSnapshot<List<Car>> snapshot) {
                //           if (snapshot.hasError) {
                //             return const Text('Something went wrong');
                //           }
                //
                //           if (snapshot.connectionState ==
                //               ConnectionState.waiting) {
                //             return carsView(
                //                 context: context,
                //                 carList: _splash2Controller.defaultCarList.value!);
                //           }
                //           if (snapshot.hasData) {}
                //           cars = snapshot.data!;
                //           return carsView(context: context, carList: cars);
                //         },
                //       ),
                child: Obx(() => controller.cars.isEmpty
                    ? CommonLoading(
                        size.width,
                        height * 0.51,
                      )
                    : carsView(context: context, carList: controller.cars)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget carsView({required BuildContext context, required List<Car> carList}) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? 2
                  : 3,
          childAspectRatio: 0.75),
      itemBuilder: (BuildContext context, index) {
        return CarCard(
            car: carList[index],
            height: MediaQuery.of(context).size.height * 0.51,
            function: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             CarDetailsScreen(car: carList[index])));
              Get.toNamed(AppLinks.carDetailsRoute, arguments: carList[index]);
            });
      },
      itemCount: carList.length,
      shrinkWrap: true,
    );
  }

  Widget carBrandsView(
      {required BuildContext context, required List<CarBrand> carBrands}) {
    return VxSwiper.builder(
      itemCount: carBrands.length,
      itemBuilder: (BuildContext context, int index) {
        // print("Les categories : ${jobCategories}");
        return CarBrandCard(
            carBrand: carBrands[index],
            height: MediaQuery.of(context).size.height * 0.1);
      },
      height: MediaQuery.of(context).size.height * 0.1,
      viewportFraction: 0.2,
      autoPlay: true,
      autoPlayAnimationDuration: 3.seconds,
      autoPlayCurve: Curves.linear,
      enableInfiniteScroll: true,
    );
  }
}
