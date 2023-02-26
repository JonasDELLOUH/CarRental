import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/my_icons.dart';
import '../models/reservation.dart';
import '../widgets/text_widgets.dart';
import 'date_handler.dart';

Widget reservationCard({required Reservation reservation, required void Function() function}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white,
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
                  myText(
                      text:
                          "${reservation.car.carBrand.carBrandName} ${reservation.car.carModel}",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      MyIcons.directionsCarFilled(color: ConstColors.blueColor, size: 20),
                      myText(
                          text:
                              " ${reservation.car.nbrPlaces.toString()} places",
                          fontSize: 20),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),

                  myText(
                      text:
                          "${'reserve_at'.tr} ${DateHandler.dateFormat(reservation.reservationDate)}", fontSize: 12),
                  SizedBox(height: 3,),
                  InkWell(
                    onTap: (){
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      // width: width * 0.45,
                      decoration: const BoxDecoration(
                          color: ConstColors.redColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(3),
                              topLeft: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3))),
                      child: Center(
                        child: myText(
                            text: 'to_free'.tr,
                            color: ConstColors.backgroundColor, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                MyIcons.attachMoney(
                    color: ConstColors.blueColor
                ),
                myText(text: " ${reservation.car.rentalPrice*0.7} FCFA/${"day".tr}", fontSize: 12)
              ],
            ),
            InkWell(
              onTap: function,
              child: Container(
                padding: const EdgeInsets.all(5),
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
                      color: ConstColors.backgroundColor, fontSize: 15),
                ),
              ),
            )
          ],
        ))
      ],
    ),
  );
}
