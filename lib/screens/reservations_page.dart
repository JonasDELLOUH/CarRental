import 'package:car_rental/models/customer.dart';
import 'package:car_rental/services/reservation_services.dart';
import 'package:car_rental/utility/reservation_card.dart';
import 'package:car_rental/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/reservation.dart';

class ReservationsPage extends StatefulWidget {
  final Customer customer;

  const ReservationsPage({Key? key, required this.customer}) : super(key: key);

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  ReservationServices reservationServices = ReservationServices();
  List<Reservation> reservations = [];

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
        child: StreamBuilder<List<Reservation>>(
          stream: reservationServices.getReservations(
              customerId: widget.customer.customerId),
          builder: (BuildContext context,
              AsyncSnapshot<List<Reservation>> snapshot) {
            if (snapshot.hasError) {
              print("erreur : ${snapshot.error} ett c'est ici }");
              snapshot.printError();
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            if (snapshot.hasData) {}
            reservations = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait) ? 1 : 2,
                  childAspectRatio: 1.5),
              itemBuilder: (BuildContext context, index) {
                return reservationCard(reservation: reservations[index]);
              },
              itemCount: reservations.length,
            );
          },
        ),
      ),
    );
  }
}
