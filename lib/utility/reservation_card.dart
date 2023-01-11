import 'package:car_rental/models/reservation.dart';
import 'package:car_rental/utility/car_card.dart';
import 'package:car_rental/utility/date_handler.dart';
import 'package:car_rental/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/my_icons.dart';

Widget reservationCard({required Reservation reservation}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20))),
    child: Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                reservation.car.carImageUrl,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  richText(
                      text:
                          "${reservation.car.carBrand.carBrandName} ${reservation.car.carModel}",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      MyIcons.directionsCarFilled(color: ConstColors.blueColor),
                      richText(
                          text:
                              " ${reservation.car.nbrPlaces.toString()} places",
                          fontSize: 15),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  richText(
                      text:
                          "${'reserve_at'.tr} ${DateHandler.myDate(reservation.reservationDate)}", fontSize: 12)
                ],
              )
            ],
          ),
        ),
        Expanded(child: Row())
      ],
    ),
  );
}
