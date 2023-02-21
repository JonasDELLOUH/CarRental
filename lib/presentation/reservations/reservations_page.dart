import 'package:car_rental/presentation/reservations/reservation_controller.dart';
import 'package:car_rental/presentation/splash2/splash2_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/models/customer.dart';
import '../../core/models/reservation.dart';
import '../../core/services/reservation_services.dart';
import '../../core/utility/reservation_card.dart';
import '../../core/widgets/text_widgets.dart';
import '../main/main_controller.dart';

class ReservationsPage extends StatelessWidget {
  final Customer customer;

  ReservationsPage({Key? key, required this.customer}) : super(key: key);

  ReservationServices reservationServices = ReservationServices();

  List<Reservation> reservations = [];

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
        // child: StreamBuilder<List<Reservation>>(
        //   stream: reservationServices.getReservationsStream(
        //       customerId: widget.customer.customerId),
        //   builder: (BuildContext context,
        //       AsyncSnapshot<List<Reservation>> snapshot) {
        //     if (snapshot.hasError) {
        //       print("erreur : ${snapshot.error} ett c'est ici }");
        //       snapshot.printError();
        //       return const Text('Something went wrong');
        //     }
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return reservationsView(
        //           context: context,
        //           reservations:
        //               _splash2Controller.defaultReservationList.value!);
        //     }
        //     if (snapshot.hasData) {}
        //     reservations = snapshot.data!;
        //     return reservationsView(
        //         context: context, reservations: reservations);
        //   },
        // ),
        child: Obx(() => controller.reservations.isEmpty
            ? Container()
            : reservationsView(context: context, reservations: controller.reservations)),
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
