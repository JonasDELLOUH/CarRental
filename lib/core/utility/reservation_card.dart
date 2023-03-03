import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/my_icons.dart';
import '../models/location.dart';
import '../widgets/text_widgets.dart';
import 'date_handler.dart';

Widget locationCard(
    {required Location location, required void Function() function}) {
  return SingleChildScrollView(
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.network(
                  location.car.carImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    myText(
                        text:
                            "${location.car.carBrand.carBrandName} ${location.car.carModel}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        MyIcons.directionsCarFilled(
                            color: ConstColors.secondaryColor, size: 20),
                        myText(
                            text:
                                " ${location.car.nbrPlaces.toString()} places",
                            fontSize: 20),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    myText(
                        text:
                            "${'reserve_at'.tr} ${DateHandler.dateFormat(location.locationDate)}",
                        fontSize: 20,
                        textAlign: TextAlign.center),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Row(
            children: [
              MyIcons.attachMoney(color: ConstColors.secondaryColor),
              myText(
                  text: " ${location.car.rentalPrice} FCFA/${"day".tr}",
                  fontSize: 12)
            ],
          ),
          InkWell(
            onTap: function,
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 100,
              decoration: const BoxDecoration(
                  color: ConstColors.redColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Center(
                child: myText(
                    text: 'to_free'.tr,
                    color: ConstColors.backgroundColor,
                    fontSize: 15),
              ),
            ),
          )
            ],
          )
        ],
      ),
    ),
  );
}
