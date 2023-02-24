import 'package:car_rental/presentation/reservations/reservation_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/models/customer.dart';
import '../../core/models/reservation.dart';
import '../../core/utility/reservation_card.dart';
import '../../core/utility/size_utils.dart';
import '../../core/widgets/common_loading.dart';
import '../../core/widgets/text_widgets.dart';

class ReservationsPage extends StatelessWidget {

  ReservationsPage({Key? key}) : super(key: key);

  ReservationController controller = Get.find<ReservationController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: richText(text: 'reservation'.tr),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Obx(() => controller.reservations.isEmpty
            ? CommonLoading(size.width ,
          size.height * 0.8,)
            : reservationsView(
                context: context, reservations: controller.reservations)),
      ),
    );
  }

  Widget reservationsView(
      {required BuildContext context,
      required List<Reservation> reservations}) {
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
