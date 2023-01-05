import 'package:car_rental/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/my_icons.dart';
import '../models/car.dart';

Widget CarCard({required Car car, required double height}) {
  return InkWell(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.zero,
      // height: height * 0.6,
      // width: height * 0.5,
      decoration: BoxDecoration(
          color: ConstColors.backgroundColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: ConstColors.primaryColor.withOpacity(0.3),
              offset: Offset(0.0, 3.0),
              blurRadius: 1,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20)),
            child: Image.network(
              car.carImageUrl,
              height: height * 0.25,
              width: height * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                richText(
                    text: "${car.carBrand.carBrandName} ${car.carModel}",
                    fontSize: 10),
                Row(
                  children: stars(car.nbrStars),
                ),
                SizedBox(height: 1,),
                Row(
                  children: [
                    MyIcons.directionsCarFilled(
                      color: ConstColors.blueColor
                    ),
                    richText(text: " ${car.nbrPlaces.toString()} places", fontSize: 15),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    MyIcons.attachMoney(
                        color: ConstColors.blueColor
                    ),
                    richText(text: " ${car.rentalPrice} FCFA/${"day".tr}", fontSize: 12)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

List<Widget> stars(int nbr) {
  List<Widget> stars = [];
  for (int i = 0; i < nbr; i++) {
    stars.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 1),
        child: MyIcons.starIcon(color: ConstColors.goldenColor, size: 20)));
  }
  return stars;
}
