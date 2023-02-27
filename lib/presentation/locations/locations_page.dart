import 'package:car_rental/core/widgets/text_widgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/models/location.dart';
import '../../core/utility/reservation_card.dart';
import '../../core/utility/size_utils.dart';
import '../../core/widgets/common_loading.dart';
import 'location_controller.dart';

class LocationsPage extends StatelessWidget {

  LocationsPage({Key? key}) : super(key: key);

  LocationController controller = Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: myText(text: 'reservation'.tr),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Obx(() => controller.isLoading.value ? CommonLoading(size.width ,
          size.height * 0.8,) : controller.reservations.isEmpty
            ? Center(child: myText(text: 'no_car_rented'.tr, fontSize: 50),)
            : reservationsView(
                context: context, reservations: controller.reservations)),
      ),
    );
  }

  Widget reservationsView(
      {required BuildContext context,
      required List<Location> reservations}) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? 1
                  : 2,
          childAspectRatio: 1.5),
      itemBuilder: (BuildContext context, index) {
        return reservationCard(
            reservation: reservations[index], function: () {});
      },
      itemCount: reservations.length,
    );
  }
}
