import 'package:car_rental/presentation/searchpage/search_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_search_bar/wp_search_bar.dart';

import '../../app/env/links.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/my_icons.dart';
import '../../core/models/car.dart';
import '../../core/services/car_services.dart';
import '../../core/utility/car_card.dart';
import '../car_details/car_details_screen.dart';

class SearchPageScreen extends StatelessWidget {
  SearchPageScreen({Key? key}) : super(key: key);
  final controller = Get.find<SearchPageController>();
  CarServices carServices = CarServices();

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: WPSearchBar(
        // iconTheme: const IconThemeData(color: ConstColors.blueColor),
        // appBarForegroundColor: ConstColors.blueColor,
        appBarBackgroundColor: ConstColors.secondaryColor,
        listOfFilters: {
          'model': {
            'name': 'model',
            'selected': false,
            'title': 'Model',
            'icon': MyIcons.carIconData(),
            'operation': 'CONTAINS'
          },
          'brand': {
            'name': 'brand',
            'selected': false,
            'title': 'brand'.tr,
            'icon': MyIcons.carBrandIconData(),
            'operation': 'CONTAINS'
          },
          'nb_places': {
            'name': "nb_places",
            'selected': false,
            'title': 'Places ',
            'icon': MyIcons.seatIconData(),
            'operation': 'CONTAINS'
          },
          'price': {
            'name': "price",
            'selected': false,
            'title': '> Price ',
            'icon': MyIcons.moneyIconData(),
            'operation': 'CONTAINS'
          }
        },
        materialDesign: {
          'title': {'text': "${'search_cars'.tr}s"}
        },
        onSearch: (filter, value, operation) async {
          if (filter == 'model') {
            print("value....: "+value.toString());
            List l = await carServices.getCarsWithFilter(model: value!);
            controller.cars.value = Car.toList(l);
          }
          if (filter == 'brand') {
            List l = await carServices.getCarsWithFilter(brand: value!);
            controller.cars.value = Car.toList(l);
          }

          if (filter == 'nb_places') {
            print("placesss");
            List l = await carServices.getCarsWithFilter(places: value!);
            controller.cars.value = Car.toList(l);
          }
          if (filter == 'price') {
            List l = await carServices.getCarsWithFilter(price: value!);
            controller.cars.value = Car.toList(l);
          }
        },
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Obx(() => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3,
                    childAspectRatio: 0.75),
                itemBuilder: (BuildContext context, index) {
                  return CarCard(
                      car: controller.cars.value![index],
                      height: height * 0.51,
                      function: () {
                        Get.toNamed(AppLinks.carDetailsRoute, arguments: controller.cars.value![index]);
                      });
                },
                itemCount: controller.cars.value!.length,
                shrinkWrap: true,
              )),
        ),
      ),
    );
  }
}
